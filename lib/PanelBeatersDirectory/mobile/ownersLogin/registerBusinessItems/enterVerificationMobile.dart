import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileLocationCheck.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/otpMobileWidget.dart';

class EnterVerificationMobile extends StatefulWidget {
  const EnterVerificationMobile({super.key});

  @override
  State<EnterVerificationMobile> createState() =>
      _EnterVerificationMobileState();
}

class _EnterVerificationMobileState extends State<EnterVerificationMobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 0.94, color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 4,
                      top: 5,
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 16,
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'raleway',
                  ),
                ),
                SizedBox(
                  width: widthDevice * 0.04,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'raleway',
                            height: 1,
                          ),
                        ),

                        //ADD BUTTON FUNCTIONALITY
                        TextSpan(
                          text: 'Log in',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 12,
                            fontFamily: 'raleway',
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFEF9040),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Enter Verification Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'ralewaybold',
                  height: 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'To ensure the security of our platform and provide the best experience for all users, we require account verification. A verification email has been sent to',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1,
              ),
            ),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'admin@actionpanel.co.za',
                style: TextStyle(
                    color: Color(0xFFEF9040),
                    fontSize: 16,
                    fontFamily: 'raleway',
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFEF9040),
                    height: 1),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            OTPMobileWidget(),
            SizedBox(
              height: 25,
            ),
            MobileLocationCheck(
              text: 'Successful Authentication',
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Didn\'t receive an email?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'raleway',
              ),
            ),
            TextButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              child: Text(
                'Send OTP to phone',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 14,
                  fontFamily: 'raleway',
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFFEF9040),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            LongOrangeMobileButton(
                onPressed: () {},
                buttonText: 'Start Sign Up Process',
                widthButton: widthDevice * 0.75)
          ],
        ),
      ),
    );
  }
}
