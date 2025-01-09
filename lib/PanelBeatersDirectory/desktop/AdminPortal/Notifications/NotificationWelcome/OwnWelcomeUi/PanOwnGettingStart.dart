import 'package:flutter/material.dart';
import '../WelcomeComponents/CommonColor.dart';

class PanownGettingStart extends StatefulWidget {
  const PanownGettingStart({super.key});

  @override
  State<PanownGettingStart> createState() => _PanownGettingStartState();
}

class _PanownGettingStartState extends State<PanownGettingStart> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        width: widthDevice,
        height: 450,
        color: CommonColor().Colors4,
        child: Row(
          children: [
            Container(
              width: widthDevice * 0.45,
              height: heightDevice,
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Get Started Now!\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29.2,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            TextSpan(
                              text: '\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Unlock the full potential of your listing, please use the following temporary login credentials to gain access to your Owners Portal:\n\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'Username: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            TextSpan(
                              text: '[Client Username – System Generated]\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'Password: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            TextSpan(
                              text: '[Client Password - System Generated]\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'Link to Owners Portal: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            TextSpan(
                              text:
                                  'https://panelbeatersdirectory.co.za/owner/\n\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'ralewaysemi',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Once logged in, you can change your credentials and password at any time.\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.4,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              width: widthDevice * 0.27,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'images/repair.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
