import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/generalButton.dart';
import 'package:webdirectories/myutility.dart';

class EmployerPlatform extends StatefulWidget {
  const EmployerPlatform({super.key});

  @override
  State<EmployerPlatform> createState() => _EmployerPlatformState();
}

class _EmployerPlatformState extends State<EmployerPlatform> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      decoration: ShapeDecoration(
        color: Color(0xFF3C4043),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
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
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Employer Platform',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.4,
                fontFamily: 'ralewaysemi',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Want to have quick access to a pool of qualified candidates? Register your business on the Panel Beater Directory via our easy sign up process. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Generalbutton(
              backgroundColor: Colors.white,
              circleColor: Colors.black,
              iconColor: Colors.white,
              text1: 'Register your business here',
              textColor: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
