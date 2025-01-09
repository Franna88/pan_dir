import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/blackIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/oTPWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/formatUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class ResetPasswordOTPFirstLogin extends StatefulWidget {
  final Function(int) changePageIndex;
  final String emailAddress;

  const ResetPasswordOTPFirstLogin(
      {super.key, required this.changePageIndex, required this.emailAddress});

  @override
  State<ResetPasswordOTPFirstLogin> createState() =>
      _ResetPasswordOTPFirstLoginState();
}

class _ResetPasswordOTPFirstLoginState
    extends State<ResetPasswordOTPFirstLogin> {
  var otpEntered = "";
  var randomOtp = "";
  var showError = false;
  bool showSuccess = false;
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

  Future<void> getOtpEntered(value) async {
    try {
      print(value);
      StoredUser? user = await getUserInfo();
      if (user != null) {
        print(user.memberId);
        QuerySnapshot<Map<String, dynamic>> docsSnapshot =
            await FirebaseFirestore.instance
                .collection('listing_members')
                .where('listingMembersId', isEqualTo: int.parse(user.memberId))
                .get();

        print('secKey: ${docsSnapshot.docs.first.data()['secKey']}');
        if (docsSnapshot.docs.isNotEmpty) {
          print(
              'otpEntered: $value, secKey: ${docsSnapshot.docs.first.data()['secKey']}');
          if (value == docsSnapshot.docs.first.data()['secKey']) {
            setState(() {
              showSuccess = true;
            });
          }
        } else {
          setState(() {
            showError = true;
          });
        }
      }
    } catch (e) {
      print('Couldn\'t get user info: $e');
    }
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
            'We see this is your first time logging in to your account. You need to reset your password to login. Please enter the code sent to your email ${maskEmail(widget.emailAddress)} to reset your password',
            textAlign: TextAlign.center,
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
        // TextButton(
        //   onPressed: () {
        //     //ADD LOGIC HERE
        //   },
        //   child: Text(
        //     'admin@actionpanel.co.za',
        //     style: widthDevice < 1500
        //         ? TextStyle(
        //             color: Color(0xFFEF9040),
        //             fontSize: 14,
        //             fontFamily: 'raleway',
        //             fontWeight: FontWeight.w500,
        //             decoration: TextDecoration.underline,
        //             decorationColor: Color(0xFFEF9040),
        //             height: 1)
        //         : TextStyle(
        //             color: Color(0xFFEF9040),
        //             fontSize: 18,
        //             fontFamily: 'raleway',
        //             fontWeight: FontWeight.w500,
        //             decoration: TextDecoration.underline,
        //             decorationColor: Color(0xFFEF9040),
        //             height: 1),
        //   ),
        // ),
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
              text1: 'Failed Authentication. Please try again.',
              textColor1: Colors.white,
              icon: Icons.one_x_mobiledata,
              onPress: () {}),
        ),
        SizedBox(
          height: 15,
        ),
        Visibility(
          visible: showSuccess,
          child: BlackIconButton(
              backgroundColor1: Colors.black,
              circleColor1: Colors.green,
              iconColor1: Colors.white,
              text1: 'Authentication successful. Click to reset password.',
              textColor1: Colors.white,
              icon: Icons.check_circle_outline,
              onPress: () {
                widget.changePageIndex(8);
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
              onPressed: () {},
              child: Text(
                'resend OTP',
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
          ],
        ),
        SizedBox(
          height: heightDevice / 50,
        ),
      ],
    );
  }
}
