import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/numberProgressBarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/orangeCheckMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/progressBarNumbersmobile.dart';

class CompleteAgreementMobile extends StatelessWidget {
  const CompleteAgreementMobile({super.key});

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
              number4: ProgressBarNumbersMobile(number: '04'),
              color4: const Color.fromARGB(255, 114, 113, 113),
              number5: ProgressBarNumbersMobile(number: '05'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Complete Agreement',
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
            Text(
              'Please complete the following online application form. Your completed contract will be available to view and download in your Owners Portal.',
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
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/completeagreement.png'),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            LongOrangeMobileButton(
              onPressed: () {
                //ADD LOGIC HERE
              },
              buttonText: 'Click here to complete Agreement',
              widthButton: widthDevice * 0.78,
            ),
          ],
        ),
      ),
    );
  }
}
