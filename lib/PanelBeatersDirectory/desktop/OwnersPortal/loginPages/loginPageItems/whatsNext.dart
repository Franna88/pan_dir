import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';

class WhatsNext extends StatelessWidget {
  Function(int) changeIndex;
  WhatsNext({super.key, required this.changeIndex});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightDevice / 30,
        ),
        NumberProgressBar(
          number1: OrangeCheckMark(),
          color1: Color.fromARGB(199, 226, 131, 43),
          number2: OrangeCheckMark(),
          color2: const Color.fromARGB(199, 226, 131, 43),
          number3: OrangeCheckMark(),
          color3: const Color.fromARGB(199, 226, 131, 43),
          number4: OrangeCheckMark(),
          color4: const Color.fromARGB(199, 226, 131, 43),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: 10,
        ),
        Text('What\'s next?',
            textAlign: TextAlign.center,
            style: heightDevice < 710
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'ralewaybold',
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice < 1500 ? 30 : 40,
                    fontFamily: 'ralewaybold',
                  )),
        SizedBox(
          height: 10,
        ),
        Container(
          height: heightDevice < 710
              ? 150
              : widthDevice < 1500
                  ? 190
                  : 225,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/watsnext.png'),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: widthDevice < 1500 ? widthDevice / 3.5 : widthDevice / 04,
          child: Text(
              'Thank you for choosing to be part of the Panel Beater Directory family! Your success is our success and we can’t wait to grow with you.',
              textAlign: TextAlign.center,
              style: heightDevice < 710
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )
                  : TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 14 : 18,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          width: widthDevice < 1500 ? widthDevice / 3.5 : widthDevice / 03,
          child: Text(
              'Your application is now being processed and you \nwill receive an email confirmation with your \nOwners Portal login code shortly.',
              textAlign: TextAlign.center,
              style: heightDevice < 710
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )
                  : TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 14 : 18,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )),
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
        LongOrangeButton(
            onPressed: () {
              changeIndex(0);
            },
            buttonText: 'Login to Owners Portal'),
        SizedBox(
          height: heightDevice < 710 ? 10 : heightDevice / 30,
        ),
      ],
    );
  }
}
