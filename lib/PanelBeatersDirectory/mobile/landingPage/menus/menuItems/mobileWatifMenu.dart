import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/generalButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';

class Mobilewatifmenu extends StatelessWidget {
  const Mobilewatifmenu({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    int menuIndex = 1;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MobileMenuIndex(menuIndex: menuIndex),
          Text(
            'Download your WATIF App',
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(166, 0, 0, 0),
                  offset: Offset(1.0, 1.0),
                ),
              ],
              height: 1.15,
              fontSize: widthDevice < 400 ? 30 :  34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
           SizedBox(
            width: 400,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Hit the road with confidence and ditch the stress! ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 400 ? 16 :  19,
                      fontFamily: 'raleway',
                    ),
                  ),
                  TextSpan(
                    text: 'WATIF',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 400 ? 16 :  19,
                      fontFamily: 'ralewaymedium',
                    ),
                  ),
                  TextSpan(
                    text:
                        ' is your free, all-in-one automotive app that empowers you with everything you need.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 400 ? 16 :  19,
                      fontFamily: 'raleway',
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Generalbutton(
            backgroundColor: Colors.white,
            circleColor: Colors.black,
            iconColor: Colors.white,
            text1: 'Learn More',
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
