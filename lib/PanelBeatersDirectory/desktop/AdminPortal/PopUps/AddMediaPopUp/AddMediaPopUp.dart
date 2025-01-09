import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class AddMediaPopup extends StatefulWidget {
  final VoidCallback onMediaAdded;
  final String? existingTitle; // Optional: used when editing
  final String? existingUrl; // Optional: used when editing
  final String? documentId; // Optional: used when editing

  const AddMediaPopup({
    super.key,
    required this.onMediaAdded,
    this.existingTitle, // Make this optional
    this.existingUrl, // Make this optional
    this.documentId, // Make this optional
  });

  @override
  State<AddMediaPopup> createState() => _AddMediaPopupState();
}

class _AddMediaPopupState extends State<AddMediaPopup> {
  late TextEditingController _titleController;
  late TextEditingController _linkController;

  @override
  void initState() {
    super.initState();
    // Initialize with existing values if they are passed (for editing)
    _titleController = TextEditingController(text: widget.existingTitle ?? '');
    _linkController = TextEditingController(text: widget.existingUrl ?? '');
  }

  Future<void> _saveMedia() async {
    String title = _titleController.text.trim();
    String link = _linkController.text.trim();

    if (title.isNotEmpty && link.isNotEmpty) {
      StoredUser? user = await getUserInfo();
      if (user != null) {
        int listingId = int.tryParse(user.id) ?? 0;

        try {
          if (widget.documentId != null) {
            // If documentId is provided, update the existing media
            await FirebaseFirestore.instance
                .collection('listings_links')
                .doc(widget.documentId)
                .update({
              'linkTitle': title,
              'urlLink': link,
              'listingsId': listingId,
            });
            print('Media updated: Title = $title, Link = $link');
          } else {
            // If no documentId, create a new media entry
            await FirebaseFirestore.instance.collection('listings_links').add({
              'linkTitle': title,
              'urlLink': link,
              'listingsId': listingId,
              'linksOrder': 0, // Adjust as necessary
            });
            print('Media saved: Title = $title, Link = $link');
          }

          widget.onMediaAdded(); // Notify parent to update UI
          Navigator.of(context).pop(); // Close the popup
        } catch (e) {
          print('Failed to save media: $e');
        }
      } else {
        print('User not found');
      }
    } else {
      print('Title and link cannot be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.4,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
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
                      widget.documentId == null ? 'Add Media' : 'Edit Media',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.65,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  PopUpTextField(
                    text: 'Link Title',
                    controller: _titleController,
                  ),
                  SizedBox(height: MyUtility(context).height * 0.02),
                  PopUpTextField(
                    text: 'URL Link',
                    controller: _linkController,
                  ),
                  SizedBox(height: MyUtility(context).height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PopUpsButton(
                        text: 'Save',
                        onTap: _saveMedia, // Save media on button tap
                      ),
                      SizedBox(width: 8),
                      PopUpsCancel(
                        text: 'Cancel',
                        onTap: () => Navigator.of(context).pop(),
                        buttonColor: Color(0xFF3C4043),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
