import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/blackIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/oTPWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/otpVerification/sendOtpVerification.dart';

class EnterVerificationCode extends StatefulWidget {
  Function changePageIndex;
  String email;
  String cell;
  EnterVerificationCode(
      {super.key,
      required this.changePageIndex,
      required this.email,
      required this.cell});

  @override
  State<EnterVerificationCode> createState() => _EnterVerificationCodeState();
}

class _EnterVerificationCodeState extends State<EnterVerificationCode> {
  var otpEntered = "";
  var randomOtp = "";
  var showError = false;
  var showSmsNotification = false;
  var otpType = "email";
  final auth = FirebaseAuth.instance;
  late ConfirmationResult confirmationResult;
//ToDo change phone number
  sendSmsForOtp() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      confirmationResult = await auth.signInWithPhoneNumber('+27716769584');
      setState(() {
        showSmsNotification = true;
        otpType = "mobile";
      });
    } catch (e) {
      print('error sending otp $e');
    }
  }

  @override
  void initState() {
    randomOtp = Random().nextInt(999999).toString().padLeft(6, '0');

    //sendOtpEmail(otp: randomOtp, email: "chrispotjnr@gmail.com");
    super.initState();
  }

  getOtpEntered(value) {
    setState(() {
      otpEntered = value;

      if (randomOtp == otpEntered && otpType == "email") {
        widget.changePageIndex();
      } else if (randomOtp == otpEntered && otpType == "mobile") {
        confirmationResult
            .confirm(otpEntered)
            .then((value) => {widget.changePageIndex()})
            .catchError((e) => {showError = true});
      } else {
        showError = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: heightDevice / 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: widthDevice < 1500 ? 25 : 30,
                          height: widthDevice < 1500 ? 25 : 30,
                          decoration: ShapeDecoration(
                            shape: OvalBorder(
                              side:
                                  BorderSide(width: 0.94, color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 3,
                          top: 4,
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: widthDevice < 1500 ? 18 : 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Go Back',
                      textAlign: TextAlign.center,
                      style: widthDevice < 1500
                          ? TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'ralewaymedium',
                            )
                          : TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'ralewaymedium',
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: widthDevice / 18,
            ),
            Text('Already have an account?',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'Log in',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 12,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      )
                    : TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 14,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: heightDevice / 18,
        ),
        Text(
          'Enter Verification Code',
          textAlign: TextAlign.center,
          style: widthDevice < 1500
              ? TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'ralewaybold',
                )
              : TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontFamily: 'ralewaybold',
                ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            'To ensure the security of our platform and provide the \nbest experience for all users, we require account \nverification. A verification email has been sent to',
            textAlign: TextAlign.center,
            maxLines: 3,
            style: widthDevice < 1500
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'raleway',
                    height: 1.3,
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'raleway',
                    height: 1.3,
                  )),
        TextButton(
          onPressed: () {
            //ADD LOGIC HERE
          },
          child: Text(
            'admin@actionpanel.co.za',
            style: widthDevice < 1500
                ? TextStyle(
                    color: Color(0xFFEF9040),
                    fontSize: 14,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFEF9040),
                    height: 1)
                : TextStyle(
                    color: Color(0xFFEF9040),
                    fontSize: 18,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFEF9040),
                    height: 1),
          ),
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
        OTPWidget(getOtpEntered: getOtpEntered),
        SizedBox(
          height: 20,
        ),
        Visibility(
          visible: showError,
          child: BlackIconButton(
              backgroundColor1: Colors.black,
              circleColor1: Colors.red,
              iconColor1: Colors.white,
              text1: 'Failed Authentication',
              textColor1: Colors.white,
              icon: Icons.one_x_mobiledata,
              onPress: () {
                widget.changePageIndex();
              }),
        ),
        Visibility(
          visible: showSmsNotification,
          child: BlackIconButton(
              backgroundColor1: Colors.black,
              circleColor1: Colors.green,
              iconColor1: Colors.white,
              text1: 'Otp sms sent',
              textColor1: Colors.white,
              icon: Icons.check,
              onPress: () {
                widget.changePageIndex();
              }),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Didn\'t receive an email?',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'raleway',
                        height: 1,
                      )),
            TextButton(
              onPressed: () {
                sendSmsForOtp();
              },
              child: Text(
                'Send OTP to phone',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 14,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                        height: 1)
                    : TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 18,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                        height: 1),
              ),
            )
          ],
        ),
        SizedBox(
          height: heightDevice / 50,
        ),
      ],
    );
  }
}
