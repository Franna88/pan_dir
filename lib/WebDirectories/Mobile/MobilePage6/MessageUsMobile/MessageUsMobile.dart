import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/getInTouch/sendGetInTouch.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/ImNotaRobot.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/MessageUsTextFieldMobile.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/emailPopup.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouchComponents/emailPopup.dart';
import '../../../../PanelBeatersDirectory/emails/getInTouch/sendGetInTouch.dart';

class MessageUsMobile extends StatefulWidget {
  const MessageUsMobile({super.key});

  @override
  State<MessageUsMobile> createState() => _MessageUsMobileState();
}

class _MessageUsMobileState extends State<MessageUsMobile> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isChecked = false;

  void _onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  Future<void> showEmailPopup(String description) => showDialog(
        context: context,
        barrierColor: Colors
            .transparent, // Set the background behind the dialog to be transparent
        builder: (context) {
          return Emailpopup(
            description: description,
          );
        },
      );

  sendEmail() async {
    if (firstNameController.text == "" &&
        lastNameController.text == "" &&
        emailController.text == "" &&
        phoneController.text == "" &&
        messageController.text == "") {
      return showEmailPopup("Some Fields are required");
    }

    if (!_isChecked) {
      return showEmailPopup("I'm not a robot validation required");
    }

    await sendGetInTouch(
        message: messageController.text,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text);
    await showEmailPopup("Thank you, your email has been sent.");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Message Us',
          style: TextStyle(
              fontSize: 24,
              color: Color(0xFF0E1013),
              fontFamily: 'ralewaysemi'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            '*Please fill in required fields',
            style: TextStyle(
                fontFamily: 'ralewaymedium',
                fontSize: 14,
                color: Color.fromRGBO(0, 0, 0, 0.35)),
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: 600,
          decoration: BoxDecoration(
              color: Color(0x14ebebeb),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MessageUsTextFieldMobile(
                text: 'First Name*',
                controller: firstNameController,
              ),
              MessageUsTextFieldMobile(
                text: 'Last Name*',
                controller: lastNameController,
              ),
              MessageUsTextFieldMobile(
                text: 'Email*',
                controller: emailController,
              ),
              MessageUsTextFieldMobile(
                text: 'Phone*',
                controller: phoneController,
              ),
              MessageUsTextFieldMobile(
                text: 'Message*',
                controller: messageController,
              ),
              SizedBox(
                height: MyUtility(context).height * 0.01,
              ),
              NotARobotContainer(
                isChecked: _isChecked,
                onChanged: _onChanged,
              )
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.025,
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: sendEmail,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0E1013),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Submit Now ',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'raleway', color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.025,
        ),
      ],
    );
  }
}
