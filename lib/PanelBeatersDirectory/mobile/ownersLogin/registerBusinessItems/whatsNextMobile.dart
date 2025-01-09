import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/numberProgressBarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/orangeCheckMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/progressBarNumbersmobile.dart';

class WhatsNextMobile extends StatelessWidget {
  const WhatsNextMobile({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberProgressBarMobile(
              number1: OrangeCheckMobile(),
              color1: Color.fromARGB(199, 226, 131, 43),
              number2: OrangeCheckMobile(),
              color2: const Color.fromARGB(199, 226, 131, 43),
              number3: OrangeCheckMobile(),
              color3: const Color.fromARGB(199, 226, 131, 43),
              number4: OrangeCheckMobile(),
              color4: const Color.fromARGB(199, 226, 131, 43),
              number5: ProgressBarNumbersMobile(number: '05'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'What\'s next?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'ralewaybold',
                  height: 1),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/watsnext.png'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Thank you for choosing to be part of the Panel Beater Directory family! Your success is our success and we can’t wait to grow with you. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Your application is now being processed and you will receive an email confirmation with your Owners Portal login code shortly. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            LongOrangeMobileButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              buttonText: 'Login to Owners Portal',
              widthButton: widthDevice * 0.78,
            ),
          ],
        ),
      ),
    );
  }
}
