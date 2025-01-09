import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/postReviewOfPanel/sendReviewPanle.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/LeaveReviewFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/LongFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/MessageFormFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LeaveReviewMobile/LeaveReviewsCompMobile/SelectStarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class LeaveReviewMobile extends StatefulWidget {
  final Function(Map<String, dynamic>) onReviewSubmit;
  Function(int) changePageIndex;
  LeaveReviewMobile(
      {Key? key, required this.changePageIndex, required this.onReviewSubmit})
      : super(key: key);

  @override
  State<LeaveReviewMobile> createState() => _LeaveReviewMobileState();
}

class _LeaveReviewMobileState extends State<LeaveReviewMobile> {
  final ScrollController _scrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ratingController = TextEditingController();
  final _reviewController = TextEditingController();
  XFile? _selectedImage;
  bool _isLoading = false;
  final _firestorage = FirebaseStorage.instance;
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _ratingController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedImage = image;
    });
  }

  Future<String?> _uploadImageToFirebase(XFile imageFile, String name) async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('ratings/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await storageRef.putFile(File(imageFile.path));

      return await storageRef.getDownloadURL();
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  sendEmail(review, email) {
    sendReviewPanel(review: review, email: email);
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Process the form submission
      String firstName = _firstNameController.text;
      String lastName = _lastNameController.text;
      String email = _emailController.text;
      String rating = _ratingController.text;
      String review = _reviewController.text;
      XFile? image = _selectedImage;
      String? imageUrl;
      DateTime now = DateTime.now();
      String formattedDate =
          "${now.year.toString().padLeft(4, '0')}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

      final String? id = await storage.read(key: 'id');

      // Upload image to Firebase Storage if selected
      /*     if (image != null) {
        try {
          if (id != null) {
            /*    final storageRef = FirebaseStorage.instance.ref().child(
                'ratings/${id}/${DateTime.now().millisecondsSinceEpoch}_${image.name}');
            final uploadTask = storageRef.putFile(File(image.path));
            final snapshot = await uploadTask;*/
            imageUrl = await _uploadImageToFirebase(image,
                '${id}/${DateTime.now().millisecondsSinceEpoch}_${image.name}');
          } else {
            print('Error uploading image: listingsId is null');
            setState(() {
              _isLoading = false;
            });
            return;
          }
        } catch (e) {
          print('Error uploading image: $e');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Error uploading image. Please try again.')));
          setState(() {
            _isLoading = false;
          });
          return;
        }
      }
*/
      // Save review data to Firestore
      try {
        if (image != null) {
          Uint8List data = await image!.readAsBytes();
          final storageRef = _firestorage.ref().child('ratings/${image!.name}');
          final uploadTask = storageRef.putData(data);
          await uploadTask;
          imageUrl = image.name;
        }

        if (id != null) {
          Map<String, dynamic> newData = {
            'listingsId': int.parse(id),
            'ratingFrom': '$firstName $lastName',
            'ratingEmail': email,
            'ratingMessage': review,
            'imageUrl': imageUrl,
            'ratingDate': formattedDate,
          };
          var notificationData = {
            "id": "",
            "listingsId": int.parse(id),
            "type": "Rating",
            "data": newData,
            "title": "New Review added",
            "from": '$firstName $lastName',
            "priority": "low",
            "date": DateTime.now(),
            "read": false,
            'rating': int.parse(rating),
          };

          print(notificationData);

          DocumentReference ratingDoc = await FirebaseFirestore.instance
              .collection('rating')
              .add(newData);

          await FirebaseFirestore.instance
              .collection('rating')
              .doc(ratingDoc.id)
              .update({'ratingId': ratingDoc.id});

          var doc = await FirebaseFirestore.instance
              .collection("notificationMessages")
              .add(notificationData);
          await FirebaseFirestore.instance
              .collection("notificationMessages")
              .doc(doc.id)
              .update({"id": doc.id}).whenComplete(() {
            sendEmail(review, email);

            _formKey.currentState!.reset();
            widget.onReviewSubmit({...newData, 'ratingId': doc.id});

            setState(() {
              _selectedImage = null;
              _isLoading = false;
              widget.changePageIndex(0);
            });
          });
        }

        // Show success message and reset the form
      } catch (e) {
        print('Error saving review: $e');

        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width * 0.85,
          height: MyUtility(context).height * 0.48,
          decoration: ShapeDecoration(
            color: Color(0xFF0E1013),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.46),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DraggableScrollbar.rrect(
              controller: _scrollController,
              backgroundColor: Color(0x7FD9D9D9),
              alwaysVisibleScrollThumb: true,
              child: ListView(
                controller: _scrollController,
                shrinkWrap: true,
                children: [
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Leave Review',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.5364,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: MyUtility(context).width * 0.8,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LeaveReviewFormFieldMobile(
                                  reviewInfo: 'First name',
                                ),
                                LeaveReviewFormFieldMobile(
                                  reviewInfo: 'Last name',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: LongFormFieldMobile(
                            reviewInfo: '*Email address',
                          ),
                        ),
                        Text(
                          '*Score',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.699999988079071),
                            fontSize: 13.022,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SelectStarMobile(
                            onRatingChanged: (rating) {
                              print('Selected rating: $rating');
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: MessageFormFieldMobile(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: _selectedImage == null
                              ? TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    side: BorderSide(
                                      width: 1,
                                      color: Colors.white.withOpacity(0.7),
                                    ),
                                    foregroundColor: Colors.white
                                        .withOpacity(0.699999988079071),
                                    minimumSize: Size(100.8, 39),
                                  ),
                                  onPressed: _pickImage,
                                  child: Text('Upload Image'),
                                )
                              : Center(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        _selectedImage!.path,
                                        height: 120,
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: _pickImage,
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2),
                                          ),
                                          side: BorderSide(
                                            width: 1,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          ),
                                          foregroundColor: Colors.white
                                              .withOpacity(0.699999988079071),
                                          minimumSize: Size(100.8, 39),
                                        ),
                                        child: Text('Change Image'),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              widget.changePageIndex(0);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Color(0xFFFF8728),
                              foregroundColor: Colors.black,
                              minimumSize: Size(100.8, 45),
                            ),
                            child: Text(
                              'Post Review',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0632,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
