import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../myutility.dart';
import '../../../../models/advertisement.dart';
import '../../../../models/storedUser.dart';
import '../../../../utils/firebaseImageUtils.dart';
import '../../../OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import '../PopUpsCommon/AttachmentPopupButton.dart';
import '../PopUpsCommon/PopUpsCancel.dart';
import '../PopUpsCommon/PopUpsButton.dart';
import '../PopUpsCommon/PopUpTextField.dart';
import '../PopUpsCommon/PopupCheckBox.dart';
import 'AddEditor.dart';

class AddAdvertPopup extends StatefulWidget {
  final Function(AdvertisementModel) onAdvertAdded;
  final Function(AdvertisementModel) onAdvertUpdated; // For updating an advert
  final StoredUser? user;
  final int adCount;
  final AdvertisementModel? advertToEdit; // Null if adding a new advert

  const AddAdvertPopup({
    super.key,
    required this.onAdvertAdded,
    required this.onAdvertUpdated, // Required for updating
    this.user,
    required this.adCount,
    this.advertToEdit, // If null, we're adding a new advert
  });

  @override
  State<AddAdvertPopup> createState() => _AddAdvertPopupState();
}

class _AddAdvertPopupState extends State<AddAdvertPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _firestorage = FirebaseStorage.instance;
  final TextEditingController _titleController = TextEditingController();
  final QuillController _descriptionController = QuillController.basic();
  bool _isLoading = false;
  XFile? _selectedImage;

  bool displayOnBusinessProfile = false;

  @override
  void initState() {
    super.initState();

    // If editing, pre-fill the fields with existing data
    if (widget.advertToEdit != null) {
      _titleController.text = widget.advertToEdit!.immageTitle;

      // Check if the description is in valid JSON format, otherwise treat it as plain text
      try {
        final delta = jsonDecode(widget.advertToEdit!.immageDescription);
        _descriptionController.document = Document.fromJson(delta);
      } catch (e) {
        // If it's not valid JSON, treat it as plain text and create a new Quill document
        _descriptionController.document = Document()
          ..insert(0, widget.advertToEdit!.immageDescription);
      }

      displayOnBusinessProfile =
          widget.advertToEdit!.displayOnBusinessProfile ?? false;

      // You may need to implement logic to load the image from a URL if necessary
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  Future<String> _getDescriptionAsPlainText() async {
    final doc = _descriptionController.document;
    return jsonEncode(doc.toDelta().toJson());
  }

  void _saveForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String descriptionText = await _getDescriptionAsPlainText();

      AdvertisementModel advertData = AdvertisementModel(
        id: widget.advertToEdit?.id ?? '', // Use existing ID if editing
        dateAdded:
            widget.advertToEdit?.dateAdded ?? DateTime.now().toIso8601String(),
        dateUpdated: DateTime.now().toIso8601String(),
        immageDescription: descriptionText,
        immageFile:
            _selectedImage?.name ?? widget.advertToEdit?.immageFile ?? '',
        immageTitle: _titleController.text,
        listingsId: int.parse(widget.user!.id),
        membersId: int.parse(widget.user!.memberId),
        specialsOrder:
            widget.advertToEdit?.specialsOrder ?? (widget.adCount + 1),
      );

      try {
        if (widget.advertToEdit != null) {
          // Editing existing advert
          if (_selectedImage != null) {
            Uint8List data = await _selectedImage!.readAsBytes();
            final storageRef =
                _firestorage.ref().child('listings/${_selectedImage!.name}');
            final uploadTask = storageRef.putData(data);
            await uploadTask;

            String? url = await getImageUrl('listings/${_selectedImage!.name}');
            advertData.immageFile = url!;
          }

          // Update the existing document using advert's ID
          await _firestore
              .collection('specials')
              .doc(advertData.id) // Use document ID to update
              .update(advertData.toMap());

          widget.onAdvertUpdated(advertData);
        } else {
          // Adding new advert
          if (_selectedImage != null) {
            Uint8List data = await _selectedImage!.readAsBytes();
            final storageRef =
                _firestorage.ref().child('listings/${_selectedImage!.name}');
            final uploadTask = storageRef.putData(data);
            await uploadTask;

            String? url = await getImageUrl('listings/${_selectedImage!.name}');
            advertData.immageFile = url!;
          }

          // Add a new document and get the document ID
          DocumentReference docRef =
              await _firestore.collection('specials').add(advertData.toMap());
          advertData.id = docRef.id; // Set the ID of the newly created advert

          widget.onAdvertAdded(
              advertData); // Notify parent that a new advert was added
        }

        if (!mounted) return;
        Navigator.pop(context);
      } catch (e) {
        print('Error saving advert: $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.92,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MyUtility(context).width,
              height: MyUtility(context).height * 0.06,
              decoration: ShapeDecoration(
                color: const Color(0xFFD17226),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.09),
                    topRight: Radius.circular(8.09),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      'Add/Edit Advert',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.73,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
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
                  children: [
                    PopUpTextField(
                      text: 'Title',
                      controller: _titleController,
                    ),
                    const SizedBox(height: 20),
                    AddEditor(controller: _descriptionController),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PopupCheckBox(
                              value: displayOnBusinessProfile,
                              onChanged: (newValue) {
                                setState(() {
                                  displayOnBusinessProfile = newValue;
                                });
                              },
                              text: 'Display on Business Profile',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Edit/Add Image:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.61,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        _selectedImage == null &&
                                widget.advertToEdit?.immageFile != null
                            ? Text(
                                widget.advertToEdit!.immageFile!,
                                style: const TextStyle(color: Colors.white),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AttachmentPopupButton(
                                      text: 'Change File', onTap: _pickImage),
                                  const SizedBox(height: 10),
                                  if (_selectedImage != null)
                                    Text(
                                      _selectedImage!.name,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                ],
                              ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopUpsButton(
                              text: 'Save',
                              onTap: _saveForm,
                              waiting: _isLoading,
                            ),
                            const SizedBox(width: 8),
                            PopUpsCancel(
                              text: 'Cancel',
                              onTap: () => Navigator.pop(context),
                              buttonColor: const Color(0xFF3C4043),
                            ),
                          ],
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
    );
  }
}
