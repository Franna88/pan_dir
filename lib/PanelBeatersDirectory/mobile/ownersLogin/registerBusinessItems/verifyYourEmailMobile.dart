import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';

class VerifyYourEmailMobile extends StatefulWidget {
  const VerifyYourEmailMobile({super.key});

  @override
  State<VerifyYourEmailMobile> createState() => _VerifyYourEmailMobileState();
}

class _VerifyYourEmailMobileState extends State<VerifyYourEmailMobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
          width: widthDevice * 0.89,
          height: heightDevice * 0.55,
          decoration: ShapeDecoration(
            color: Color(0xFFD9D9D9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClosePageButton(
                    closeDialog: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Verify your Email!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'ralewaybold',
                        height: 1),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/watsnext.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'To ensure the security of our platform and provide the best experience for all users, we require account verification. A verification email has been sent to ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'admin@actionpanel.co.za',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 16,
                            fontFamily: 'raleway',
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xFFEF9040),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn’t receive an email?\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'Click here to resend',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        //ADD LOGIC HERE
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFE2822B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Got it thanks',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'ralewaymedium',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
