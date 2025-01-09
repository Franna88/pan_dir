import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/BiggerPopupTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/AttachmentPopupButton.dart';
import '../PopUpsCommon/PopUpsCancel.dart';

class AddMemberPopup extends StatefulWidget {
  final List<Map<String, dynamic>> teamProfiles;
  final Function(Map<String, dynamic>) add;
  final Function(Map<String, dynamic>)? update; // Add for updating
  final bool isEditing; // Flag to indicate if editing
  final Map<String, dynamic>? existingProfile; // Existing data for editing

  const AddMemberPopup({
    super.key,
    required this.teamProfiles,
    required this.add,
    this.update, // Optional for updating
    this.isEditing = false, // Default is false (adding mode)
    this.existingProfile, // Data for editing if available
  });

  @override
  State<AddMemberPopup> createState() => _AddMemberPopupState();
}

class _AddMemberPopupState extends State<AddMemberPopup> {
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool _isLoading = false;
  XFile? _selectedImage;
  String imageStatus = "";
  final _firestorage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.existingProfile != null) {
      // Pre-fill the fields with existing data if editing
      _firstNameController.text = widget.existingProfile!['firstName'];
      _surname.text = widget.existingProfile!['surname'];
      _descriptionController.text = widget.existingProfile!['shortDescription'];
      imageStatus = widget.existingProfile!['personPhoto'];
    }
  } /*

    Future<void> _pickImage(type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      Uint8List data = await image!.readAsBytes();
      final storageRef = _firestorage.ref().child('listings/${image!.name}');
      final uploadTask = storageRef.putData(data);
      await uploadTask;

      String? url = await getImageUrl('listings/${image!.name}');
      print(url);

      setState(() {
       
          widget.updateLogo(image!.name!);
          _logoUrl = "listings/${image!.name!}";
      
      }); /* */
    }
  }
*/

  // Function to pick an image
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    print(image);
    print(image!.name);
    if (image != null) {
      // Check if file size is within the 2 MB limit
      final int imageSize = await File(image.path).length();
      /*  if (imageSize > 2 * 1024 * 1024) {
        setState(() {
          imageStatus = "Image to big";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Image is too large. Please select an image under 2 MB.'),
          ),
        );
        return;
     }*/
    }

    setState(() {
      _selectedImage = image;
      imageStatus = "${(image!.name)}";
    });
  }

  // Function to upload the selected image to Firebase Storage and get the URL
  Future<String?> _uploadImageToFirebase(XFile imageFile) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('team_profiles/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(File(imageFile.path));

      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  // Function to handle the submission (both for adding and updating)
  Future<void> handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();

        if (user == null) throw "User not found";

        // Upload image to Firebase if an image was selected
        String? imageUrl;
        if (_selectedImage != null) {
          imageUrl = await _uploadImageToFirebase(_selectedImage!);
          if (imageUrl == null) {
            throw "Failed to upload image";
          }
        }

        var memberData = {
          'firstName': _firstNameController.text,
          'surname': _surname.text,
          'shortDescription': _descriptionController.text,
          'personPhoto': _selectedImage!.name,
          'membersId': int.tryParse(user.memberId) ?? 0,
          'listingsId': int.tryParse(user.id) ?? 0,
          'teamOrder': widget.teamProfiles.length + 1,
          'dateUpdated': DateTime.now(),
        };

        if (widget.isEditing && widget.existingProfile != null) {
          // Update existing member
          await _firestore
              .collection('listings_team')
              .doc(widget.existingProfile![
                  'docId']) // Assuming you store the document ID
              .update(memberData);

          // Call the update callback
          if (widget.update != null) {
            widget.update!(memberData);
          }
        } else {
          // Add new member
          await _firestore.collection('listings_team').add(memberData);
          widget.add(memberData);
        }

        setState(() {
          _isLoading = false;
        });

        Navigator.pop(context);
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again.')),
        );
        print('Error adding/updating member: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: MyUtility(context).width * 0.3,
            height: MyUtility(context).height * 0.7,
            decoration: ShapeDecoration(
              color: Color(0xFFD9D9D9),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MyUtility(context).width,
                  height: MyUtility(context).height * 0.06,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD17226),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.09),
                        topRight: Radius.circular(8.09),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.isEditing
                              ? 'Edit Member'
                              : 'Add Member', // Change the title based on mode
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.65,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        CloseButton(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PopUpTextField(
                          text: 'First Name',
                          controller: _firstNameController,
                        ),
                        SizedBox(height: 20),
                        PopUpTextField(
                          text: 'Last Name',
                          controller: _surname,
                        ),
                        SizedBox(height: 20),
                        BiggerPopupTextField(
                          text: 'Description',
                          controller: _descriptionController,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            AttachmentPopupButton(
                              text: 'Choose Image',
                              onTap: _pickImage,
                            ),
                            Visibility(
                              visible: imageStatus != "",
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Existing Image: ${imageStatus}',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 49, 23, 23)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MyUtility(context).height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.17,
                              child: Text(
                                'Note: Image may not be larger than 2 megabytes. Preferable landscape images. Image format: .jpg, jpeg, .png and .gif',
                                style: TextStyle(
                                  color: Color(0xFFD17226),
                                  fontSize: 10,
                                  fontFamily: 'ralewaymedium',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MyUtility(context).height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopUpsButton(
                              text: widget.isEditing
                                  ? 'Update'
                                  : 'Save', // Change button text based on mode
                              onTap: handleSubmit,
                              waiting:
                                  _isLoading, // Shows loading indicator on button
                            ),
                            SizedBox(width: 8),
                            PopUpsCancel(
                              text: 'Cancel',
                              onTap: () {
                                Navigator.pop(context);
                              },
                              buttonColor: Color(0xFF3C4043),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Center(
              child: Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
