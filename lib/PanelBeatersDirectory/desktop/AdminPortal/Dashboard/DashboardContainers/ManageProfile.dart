import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/ProfilePassword.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import '../../ManageMyAccount/ManageComponents/AccountDatePicker.dart';
import '../../ManageMyAccount/ManageComponents/AccountLongTextField.dart';
import 'DashProfileView.dart';

class ManageProfile extends StatefulWidget {
  final Function(int) navigateToPage;

  const ManageProfile({super.key, required this.navigateToPage});

  @override
  State<ManageProfile> createState() => _ManageProfileState();
}

class _ManageProfileState extends State<ManageProfile> {
  // Text Controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? dateOfBirth;

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  void _getUserProfile() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      setState(() {
        fullNameController.text = user.fullName;
        emailController.text = user.email;
        phoneController.text = user.cell;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: 1487,
              height: MyUtility(context).height * 0.85,
              decoration: ShapeDecoration(
                color: Color(0xFF181B1D),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.64,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(9.57),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage My Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6064,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Please fill in all fields below. For your safety, update your password regularly. ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Remember to save your changes after making any updates.',
                              style: TextStyle(
                                color: Color(0xFFFF8728),
                                fontSize: 14.73,
                                fontFamily: 'ralewaysemi',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      AccountLongTextField(
                        descriptionText: 'Full Name',
                        length: 0.8,
                        controller: fullNameController, // Bind full name
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      AccountLongTextField(
                        descriptionText: 'Email Address',
                        length: 0.8,
                        controller: emailController, // Bind email address
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      AccountLongTextField(
                        descriptionText: 'Mobile Phone (e.g. +27731112468):',
                        length: 0.8,
                        controller: phoneController, // Bind mobile phone
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      AccountDatePicker(
                        descriptionText: 'Date of Birth:',
                        length: 0.8,
                        hintText: 'yyyy/mm/dd',
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      ProfilePassword(
                          descriptionText: 'New Password', length: 0.9),
                      SizedBox(
                        height: MyUtility(context).height * 0.015,
                      ),
                      ProfilePassword(
                          descriptionText: 'Confirm Password', length: 0.9),
                      SizedBox(
                        height: MyUtility(context).height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AddButton(
                              text: '   Save   ',
                              onPressed: () {
                                // Save profile data logic here
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
