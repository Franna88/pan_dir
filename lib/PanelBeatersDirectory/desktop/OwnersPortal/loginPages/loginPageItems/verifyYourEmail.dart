import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';

class VerifyYourEmail extends StatelessWidget {
  const VerifyYourEmail({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClosePageButton(
                closeDialog: () {},
              ),
              const SizedBox(
                height: 20,
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
                height: 15,
              ),
              Container(
                height: 200,
                width: 200,
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
              Text(
                'To ensure the security of our platform and provide the best experience for all users, we require account verification. \nA verification email has been sent',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'to ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'raleway',
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
                          fontSize: 20,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFEF9040),
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive an email? ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'raleway',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        //ADD LOGIC HERE
                      },
                      child: Text(
                        'Click here to resend',
                        style: TextStyle(
                          color: Color(0xFFEF9040),
                          fontSize: 20,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFEF9040),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NextButton(onPressed: () {}, buttonText: 'Got it thanks'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
