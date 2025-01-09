import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/generalButton.dart';
import 'package:webdirectories/myutility.dart';

class WhatIsJobFinderMobile extends StatefulWidget {
  const WhatIsJobFinderMobile({super.key});

  @override
  State<WhatIsJobFinderMobile> createState() => _WhatIsJobFinderMobileState();
}

class _WhatIsJobFinderMobileState extends State<WhatIsJobFinderMobile> {
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'What is Job Finder?',
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
              'Job Finder is a free service for both job seekers and featured businesses within the Auto Body Repair industry in Southern Africa.',
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
              text1: 'Learn More',
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
