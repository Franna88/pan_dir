import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopupCheckBox.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../models/users.dart';

class NewUserPopup extends StatefulWidget {
  final Function(int, String) onSubmit;
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  Function(String?)? sendResetLink;
  final UserModel? editUser;

  NewUserPopup({
    super.key,
    required this.onSubmit,
    required this.fullNameController,
    required this.emailController,
    required this.mobileController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.sendResetLink,
    this.editUser,
  });

  @override
  State<NewUserPopup> createState() => _NewUserPopupState();
}

class _NewUserPopupState extends State<NewUserPopup> {
  bool displayOnProfile = false; // Checkbox value
  bool checkIfEdit = false;
  int userStatus = 0;
  @override
  void initState() {
    super.initState();
    if (widget.editUser != null) {
      checkIfEdit = true;
      displayOnProfile = widget.editUser!.status == "Active" ? true : false;
      userStatus = widget.editUser!.status == "Active" ? 1 : 0;
      widget.fullNameController.text = widget.editUser!.firstName;
      widget.emailController.text = widget.editUser!.email;
      widget.mobileController.text = widget.editUser!.cell;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.7,
        decoration: ShapeDecoration(
          color: const Color(0xFFD9D9D9), // Light grey background
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.grey, // Optional border color
            ),
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top header with title and close button
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.06,
                decoration: const ShapeDecoration(
                  color: Color(0xFFD17226), // Orange color for header
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
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Request New User',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              14.61, // Matching the previous title font size
                          fontFamily: 'Raleway', // Consistent font family
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Close popup on press
                      },
                    ),
                  ],
                ),
              ),

              // Main form content
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PopUpTextField(
                      text: 'Full Name',
                      controller: widget.fullNameController,
                    ),
                    const SizedBox(height: 20),
                    PopUpTextField(
                      text: 'Email',
                      controller: widget.emailController,
                    ),
                    const SizedBox(height: 20),
                    PopUpTextField(
                      text: 'Mobile Phone',
                      controller: widget.mobileController,
                    ),
                    Visibility(
                      visible: checkIfEdit == false,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          PopUpTextField(
                            text: 'Password',
                            controller: widget.passwordController,
                          ),
                          const SizedBox(height: 20),
                          PopUpTextField(
                            text: 'Confirm Password',
                            controller: widget.confirmPasswordController,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: checkIfEdit,
                      child: PopupCheckBox(
                        value: displayOnProfile,
                        onChanged: (newValue) {
                          setState(() {
                            displayOnProfile = newValue ?? false;
                            if (newValue) {
                              userStatus = 1;
                            } else {
                              userStatus = 0;
                            }
                          });
                        },
                        text: 'Active User',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: PopUpsButton(
                            text: checkIfEdit ? "Save User" : 'Create User',
                            onTap: () {
                              if (checkIfEdit) {
                                widget.onSubmit(
                                    userStatus, widget.editUser!.id);
                              } else {
                                widget.onSubmit(0, "");
                              }
                            }, // Button action
                          ),
                        ),
                        Visibility(
                          visible: checkIfEdit,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: PopUpsButton(
                              text: 'Send Reset Password Link',
                              onTap: () {
                                widget.sendResetLink!(
                                    widget.emailController.text);
                              }, // Button action
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
