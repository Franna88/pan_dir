import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUpsCommon/PopUpsCancel.dart';

class ContactPopup extends StatefulWidget {
  final Function(Map<String, dynamic> newContact) onAddContact;
  final Map<String, dynamic>?
      existingContact; // New parameter for existing contact
  VoidCallback refreshList;
  ContactPopup(
      {super.key,
      required this.onAddContact,
      this.existingContact,
      required this.refreshList}); // Make it optional

  @override
  State<ContactPopup> createState() => _ContactPopupState();
}

class _ContactPopupState extends State<ContactPopup> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _contactPersonController =
      TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Prepopulate the fields if editing an existing contact
    if (widget.existingContact != null) {
      _contactPersonController.text =
          widget.existingContact!['contactPerson'] ?? '';
      _designationController.text =
          widget.existingContact!['contactPersonDesignation'] ?? '';
      _phoneController.text =
          widget.existingContact!['contactPersonCell'] ?? '';
      _emailController.text =
          widget.existingContact!['contactPersonEmail'] ?? '';
    }
  }

  void _onsaveform() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        StoredUser? user = await getUserInfo();
        if (user == null) throw "User not found";

        Map<String, dynamic> contactData = {
          'contactPerson': _contactPersonController.text,
          'contactPersonCell': _phoneController.text,
          'contactPersonEmail': _emailController.text,
          'contactPersonDesignation': _designationController.text,
          'listingsId': int.parse(user.id),
        };
        if (widget.existingContact != null) {
          // Editing an existing contact
          await _firestore
              .collection('contact_person')
              .doc(widget.existingContact!['id']) // Use the correct document ID
              .update(contactData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contact updated successfully')),
          );
        } else {
          // Adding a new contact
          await _firestore.collection('contact_person').add(contactData);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Contact added successfully')),
          );
        }

        widget.onAddContact(contactData); // Pass updated or new contact back

        if (!mounted) return;
        setState(() {
          _isLoading = false;
          widget.refreshList();
        });

        Navigator.of(context).pop(); // Close the dialog
      } catch (e) {
        print('Error saving contact: $e');
        if (!mounted) return;

        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Something went wrong. Please try again')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.565,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      widget.existingContact != null
                          ? 'Edit Contact'
                          : 'Insert Registration', // Update title based on action
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
                  children: [
                    PopUpTextField(
                      text: 'Designation',
                      controller: _designationController,
                    ),
                    SizedBox(height: MyUtility(context).height * 0.02),
                    PopUpTextField(
                      text: 'Name & Surname',
                      controller: _contactPersonController,
                    ),
                    SizedBox(height: MyUtility(context).height * 0.02),
                    PopUpTextField(
                      text: 'Phone',
                      controller: _phoneController,
                    ),
                    SizedBox(height: MyUtility(context).height * 0.02),
                    PopUpTextField(
                      text: 'Email',
                      controller: _emailController,
                    ),
                    SizedBox(height: MyUtility(context).height * 0.02),
                    Row(
                      children: [
                        PopUpsButton(
                          text: widget.existingContact != null
                              ? 'Update'
                              : 'Save', // Update button text based on action
                          onTap: _onsaveform,
                          waiting: _isLoading,
                        ),
                        SizedBox(width: 8),
                        PopUpsCancel(
                          text: 'Cancel',
                          onTap: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          buttonColor: Color(0xFF3C4043),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
