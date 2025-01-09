import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/ImNotaRobot.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobimeComponent/MessageUsTextFieldMobile.dart';
import 'package:webdirectories/myutility.dart';

class ContactUsTextBlock extends StatefulWidget {
  const ContactUsTextBlock({super.key});

  @override
  State<ContactUsTextBlock> createState() => _ContactUsTextBlockState();
}

class _ContactUsTextBlockState extends State<ContactUsTextBlock> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width / 1.2,
          height: 600,
          decoration: BoxDecoration(
              color: Color(0x14ebebeb),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
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
            onPressed: () {},
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
