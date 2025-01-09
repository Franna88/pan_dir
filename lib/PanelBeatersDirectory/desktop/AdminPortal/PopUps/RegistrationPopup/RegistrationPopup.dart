import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsCancel.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class RegistrationPopup extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddRegistration;
  final Function(String, Map<String, dynamic>)? onUpdateRegistration;
  final Map<String, dynamic>? existingRegistration;

  const RegistrationPopup(
      {super.key,
      required this.onAddRegistration,
      this.existingRegistration,
      this.onUpdateRegistration});

  @override
  State<RegistrationPopup> createState() => _RegistrationPopupState();
}

class _RegistrationPopupState extends State<RegistrationPopup> {
  List<DropdownMenuItem<String>> registrationTypeData = [];
  var formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _registrationType = TextEditingController();
  final TextEditingController _registrationNumber = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getRegistrationTypes();

    if (widget.existingRegistration != null) {
      // Pre-fill form if editing
      _registrationType.text =
          widget.existingRegistration!['registrationTypeId'].toString();
      _registrationNumber.text =
          widget.existingRegistration!['registrationNumbers'].toString();
      displayOnBusinessProfile =
          widget.existingRegistration!['registrationDisplay'] == 1;
    } else {
      setState(() {
        _registrationType.text = '0';
      });
    }
  }

  void _getRegistrationTypes() async {
    try {
      QuerySnapshot<Map<String, dynamic>> registrationSnapshot =
          await _firestore.collection('registration_type').get();
      List<DropdownMenuItem<String>> registrationTypes = [
        const DropdownMenuItem(
          value: '',
          child: Text('-- Select --'),
        )
      ];
      for (var doc in registrationSnapshot.docs) {
        String id = doc.data()['registrationTypeId'].toString();
        String name = doc.data()['registrationType'];
        registrationTypes.add(DropdownMenuItem<String>(
          value: id,
          child: Text(name),
        ));
      }

      setState(() {
        registrationTypeData = registrationTypes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Couldn\'t fetch registration types.'),
          ),
        );
      }
    }
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });

        StoredUser? user = await getUserInfo();
        if (user == null) throw "User not found";

        var registrationData = {
          'registrationTypeId': int.parse(_registrationType.text),
          'registrationNumbers': int.parse(_registrationNumber.text),
          'registrationDisplay': displayOnBusinessProfile ? 1 : 0,
          'listingsId': int.parse(user.id),
          'dateAdded': DateTime.now(),
        };

        if (widget.existingRegistration != null &&
            widget.existingRegistration!.containsKey('id')) {
          // Update existing registration using the document ID
          await _firestore
              .collection('registration_numbers')
              .doc(widget
                  .existingRegistration!['id']) // Use the document ID here
              .update(registrationData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration updated successfully')),
          );

          widget.onUpdateRegistration!(
              widget.existingRegistration!['id'], registrationData);
        } else {
          // Add new registration
          await _firestore
              .collection('registration_numbers')
              .add(registrationData);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration added successfully')),
          );
        }

        widget.onAddRegistration(registrationData);

        setState(() {
          _isLoading = false;
        });
        Navigator.pop(context);
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading == true
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : Container(
              width: MyUtility(context).width * 0.3,
              height: MyUtility(context).height * 0.43,
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
                            'Insert Registration',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.61,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        CloseButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PopUpDropdownField(
                              text: 'Registration Type',
                              controller: _registrationType,
                              items: registrationTypeData,
                              initialValue: _registrationType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PopUpTextField(
                              text: 'Registration Number',
                              controller: _registrationNumber,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PopupCheckBox(
                              value: displayOnBusinessProfile,
                              onChanged: (newValue) {
                                setState(() {
                                  print(newValue);
                                  displayOnBusinessProfile = newValue;
                                });
                              },
                              text: 'Display on Business Profile',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: PopUpsButton(
                                      text: 'Save',
                                      onTap: onSubmit,
                                      waiting: _isLoading),
                                ),
                                PopUpsCancel(
                                  text: 'Cancel',
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  buttonColor: Color(0xFF3C4043),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
    );
  }
}
