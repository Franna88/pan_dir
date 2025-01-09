import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class AddImagePopup extends StatefulWidget {
  final Function(Map<String, dynamic> imageData) onImageUpload;
  final Map<String, dynamic>? existingImage; // Optional existing image data

  const AddImagePopup(
      {super.key, required this.onImageUpload, this.existingImage});

  @override
  State<AddImagePopup> createState() => _AddImagePopupState();
}

class _AddImagePopupState extends State<AddImagePopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _imageTitleTypeController =
      TextEditingController();
  XFile? _selectedImage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingImage != null) {
      // If editing, pre-fill the image title
      _imageTitleTypeController.text = widget.existingImage!['immageTitle'];
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image;
    });
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();
        if (user == null) {
          _showSnackBar('User not found');
          setState(() {
            _isLoading = false;
          });
          return;
        }

        XFile? image = _selectedImage;
        if (image == null && widget.existingImage == null) {
          _showSnackBar('Please select an image');
          setState(() {
            _isLoading = false;
          });
          return;
        }

        String fileName;
        if (image != null) {
          Uint8List data = await image.readAsBytes();
          final storageRef = _firestorage.ref().child('listings/${image.name}');
          final uploadTask = storageRef.putData(data);
          await uploadTask;
          fileName = image.name;
        } else {
          fileName = widget.existingImage![
              'immageFile']; // Keep the existing image file name
        }

        Map<String, dynamic> imageData = {
          'dateAdded': widget.existingImage == null
              ? DateTime.now().toIso8601String()
              : widget.existingImage!['dateAdded'],
          'dateUpdated': DateTime.now().toIso8601String(),
          'immageTitle': _imageTitleTypeController.text,
          'immageFile': fileName,
          'listingsId': int.parse(user.id),
        };

        if (widget.existingImage == null) {
          // Adding a new image
          await _firestore.collection('gallery').add(imageData);
        } else {
          // Editing an existing image
          await _firestore
              .collection('gallery')
              .doc(widget.existingImage!['docId'])
              .update(imageData);
        }

        widget.onImageUpload(imageData);
        _showSnackBar('Image saved successfully');
        Navigator.of(context).pop();
      } catch (e) {
        print('Error saving image: $e');
        _showSnackBar('Something went wrong. Please try again.');
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.55,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Title bar and close button
            _buildTitleBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopUpTextField(
                      text: 'Image Title',
                      controller: _imageTitleTypeController,
                    ),
                    SizedBox(height: 20),
                    _buildImagePreview(),
                    SizedBox(height: MyUtility(context).height * 0.02),
                    _buildSaveCancelButtons(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              widget.existingImage == null ? 'Add Image' : 'Edit Image',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.65,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          CloseButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePreview() {
    if (_selectedImage != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            _selectedImage!.path,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          AttachmentPopupButton(text: 'Change File', onTap: _pickImage),
        ],
      );
    } else if (widget.existingImage != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            widget.existingImage!['immageFile'],
            width: 100,
            height: 100,
          ),
          SizedBox(height: 20),
          AttachmentPopupButton(text: 'Change File', onTap: _pickImage),
        ],
      );
    } else {
      return AttachmentPopupButton(text: 'Attach File', onTap: _pickImage);
    }
  }

  Widget _buildSaveCancelButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PopUpsButton(
          text: 'Save',
          onTap: _saveForm,
          waiting: _isLoading,
        ),
        SizedBox(width: 8),
        PopUpsCancel(
          text: 'Cancel',
          onTap: () {
            Navigator.of(context).pop();
          },
          buttonColor: Color(0xFF3C4043),
        ),
      ],
    );
  }
}
