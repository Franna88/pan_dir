import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:file_picker/file_picker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDatePicker.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class DocumentPopup extends StatefulWidget {
  final Map<String, dynamic>? existingDocument;
  final VoidCallback refreshList;
  const DocumentPopup(
      {super.key, this.existingDocument, required this.refreshList});

  @override
  State<DocumentPopup> createState() => _DocumentPopupState();
}

class _DocumentPopupState extends State<DocumentPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _subCategoryController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  List<Map<String, dynamic>> _documentCategoryData = [];
  List<DropdownMenuItem<String>> _documentSubCategoryMenuData = [];
  List<Map<String, dynamic>> _documentSubCategoryData = [];
  Map<String, dynamic> _pickedFiles = {
    'file': null,
    'fileName': '',
  };
  bool emailNotification = false;
  bool _isLoading = false;
  String fileStatus = "No File Chosen";

  @override
  void initState() {
    super.initState();
    // Prepopulate fields if editing an existing document
    if (widget.existingDocument != null) {
      print(widget.existingDocument);

      fileStatus = widget.existingDocument!['documentFile'];

      _titleController.text = widget.existingDocument!['documentTitle'] ?? '';
      _expiryController.text = widget.existingDocument!['expiryDate'] ?? '';
      emailNotification = widget.existingDocument!['expEmail'] ?? false;
      // Handle pre-selected files if needed
    }
    _getDocumentCategory(); // Assuming this method is necessary for dropdown options
  }

  void _getDocumentCategory() async {
    QuerySnapshot<Map<String, dynamic>> docCategorySnapShot =
        await _firestore.collection('document_category').get();
    QuerySnapshot<Map<String, dynamic>> docSubCategorySnapShot =
        await _firestore.collection('document_sub_category').get();

    List<DropdownMenuItem<String>> documentSubCategoryData = [
      const DropdownMenuItem(value: '', child: Text('-- Select --')),
    ];
    List<Map<String, dynamic>> documentCategoryData = [];

    if (docCategorySnapShot.docs.isNotEmpty) {
      for (var doc in docSubCategorySnapShot.docs) {
        String id = doc.data()['documentSubCategoryId'].toString();
        String name = doc.data()['documentSubCategory'];

        documentSubCategoryData.add(DropdownMenuItem(
          value: id,
          child: Text(name),
        ));
      }
    }

    if (docCategorySnapShot.docs.isNotEmpty) {
      documentCategoryData =
          docCategorySnapShot.docs.map((doc) => doc.data()).toList();
    }

    setState(() {
      _documentCategoryData = documentCategoryData;
      _documentSubCategoryData =
          docSubCategorySnapShot.docs.map((doc) => doc.data()).toList();
      _documentSubCategoryMenuData = documentSubCategoryData;
      _categoryController.text =
          widget.existingDocument!['documentCategory'] ?? '';
      _subCategoryController.text =
          widget.existingDocument!['documentSubCategory'] ?? '';
      print(_documentSubCategoryMenuData);
    });
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        if (widget.existingDocument != null) {
          // Editing an existing document
          await _firestore
              .collection('listings_documents')
              .doc(widget.existingDocument!['id'])
              .update({
            'documentCategoryId': _categoryController.text,
            'documentSubCategoryId': _subCategoryController.text,
            'documentTitle': _titleController.text,
            'expiryDate': _expiryController.text,
            'expEmail': emailNotification,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Document updated successfully')),
          );

          widget.refreshList();
          Navigator.pop(context);
        } else {
          // Adding a new document
          if (_pickedFiles['file'] == null || _pickedFiles['fileName'] == '') {
            // Handle no file selected
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select a file to upload')),
            );
            setState(() {
              _isLoading = false;
            });
            return;
          }

          // Proceed with file upload
          await uploadFilesAndSaveLinks(
              _pickedFiles['file'] as Uint8List, _pickedFiles['fileName']);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Document added successfully')),
          );
        }

        Navigator.pop(context);

        setState(() {
          _isLoading = false;
          widget.refreshList();
        });
      } catch (e) {
        print('Error adding/updating document: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again')),
        );
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> uploadFilesAndSaveLinks(Uint8List file, String fileName) async {
    StoredUser? user = await getUserInfo();

    if (user == null) throw "User not found";

    // Upload file
    try {
      Reference storageRef = _firestorage.ref().child('documents/$fileName');
      UploadTask uploadTask = storageRef.putData(file);

      await uploadTask.whenComplete(() {});
    } catch (e) {
      print('Error uploading file: $e');
    }

    try {
      // Store document in listings_documents collection

      int category = _documentCategoryData
          .where((cat) => cat['documentCategory'] == _categoryController.text)
          .first['documentCategoryId'];
      int subCategory = _documentSubCategoryData
          .where((cat) =>
              cat['documentSubCategory'] == _subCategoryController.text)
          .first['documentSubCategoryId'];
      await _firestore.collection('listings_documents').add({
        'listingsId': int.parse(user.id),
        'membersId': int.parse(user.memberId),
        'documentCategoryId': category,
        'documentSubCategoryId': subCategory,
        'documentFile': fileName,
        'documentTitle': _titleController.text,
        'expiryDate': _expiryController.text,
        'expEmail': emailNotification,
        'dateAdded': DateTime.now(),
        'dateUpdate': ''
      });

      // Store document in documents collection
      await _firestore.collection('documents').add({
        'documentFile': fileName,
        'documentTitle': _titleController.text,
        'listingsId': int.parse(user.id),
        'membersId': int.parse(user.memberId),
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error adding document: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again')),
      );
    }
  }

  void _pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'png', 'jpg', 'jpeg', 'doc', 'docx'],
        allowMultiple: false,
      );

      if (result != null) {
        Uint8List file = result.files.first.bytes!;
        String fileName = result.files.first.name;

        setState(() {
          _pickedFiles = {
            'file': file,
            'fileName': fileName,
          };
          fileStatus = "${fileName}";
        });
      } else {
        // Handle case when no file is selected
        setState(() {
          _pickedFiles = {'file': null, 'fileName': ''};
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No file selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick files: $e')),
      );
    }
  }

  void _onSubCategoryChanged(String subCategoryValue) {
    String newCategoryValue = '';

    _documentSubCategoryData.forEach((subcategory) {
      if (subcategory['documentSubCategoryId'] == int.parse(subCategoryValue)) {
        newCategoryValue = _documentCategoryData
            .where((category) =>
                category['documentCategoryId'] ==
                subcategory['documentCategoryId'])
            .first['documentCategory'];
      }
    });
    setState(() {
      _categoryController.text = newCategoryValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.70,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Insert Document',
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
                        foregroundColor: WidgetStateProperty.all(Colors.white)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PopUpTextField(
                      text: 'Category',
                      controller: _categoryController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopUpDropdownField(
                      text: 'Sub Category',
                      controller: _subCategoryController,
                      items: _documentSubCategoryMenuData,
                      initialValue: '',
                      onChanged: _onSubCategoryChanged,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopUpTextField(
                      text: 'Title',
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "File (.pdf)",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.73,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: AttachmentPopupButton(
                              text: 'Attach File', onTap: _pickFiles),
                        ),
                        Text(
                          "${fileStatus}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.73,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PopUpDatePicker(
                      text: 'Expiry Date',
                      controller: _expiryController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notification Email',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                PopupCheckBox(
                                  value: emailNotification,
                                  onChanged: (newValue) {
                                    setState(() {
                                      emailNotification = newValue;
                                    });
                                  },
                                  text: 'Yes',
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                PopupCheckBox(
                                  value: !emailNotification,
                                  onChanged: (newValue) {
                                    setState(() {
                                      emailNotification = !newValue;
                                    });
                                  },
                                  text: 'No',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PopUpsButton(
                          text: widget.existingDocument != null
                              ? 'Update'
                              : "Insert",
                          onTap: _saveForm,
                          waiting: _isLoading,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        PopUpsCancel(
                          text: 'Cancel',
                          onTap: () {
                            Navigator.pop(context);
                          },
                          buttonColor: Color(0xFF3C4043),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
