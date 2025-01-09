import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/OurMissionMobile.dart/OurMissionMobileComponents/MissionMobileIconText.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/OurMissionMobile.dart/OurMissionMobileComponents/RightMobileTextIcon.dart';
import 'package:webdirectories/myutility.dart';

class OurMissionMobile extends StatefulWidget {
  const OurMissionMobile({super.key});

  @override
  State<OurMissionMobile> createState() => _OurMissionMobileState();
}

class _OurMissionMobileState extends State<OurMissionMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "8",
                      style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'ralewaybold',
                          color: Color(0xFFFBFBFB)),
                    ),
                    Text(
                      "Countries",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "1765",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          /*fontFamily: 'ralewaybold',*/
                          color: Color(0xFFFBFBFB)),
                    ),
                    Text(
                      " Cities &\nSuburbs",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "65M",
                      style: TextStyle(
                          fontSize: 32,
                          /*fontFamily: 'ralewaybold',*/
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFBFBFB)),
                    ),
                    Text(
                      "Unique Views",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.015,
            ),
            Image.asset('images/buisnessm.png'),
            SizedBox(
              height: MyUtility(context).height * 0.015,
            ),
            Text(
              "Our Mission & Vision",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'ralewaybold',
                color: Color(0xFF65DAFF),
              ),
            ),
            Text(
              '#WeConnect',
              style: TextStyle(
                fontSize: 42,
                fontFamily: 'ralewaysemi',
                color: Colors.white,
              ),
            ),
            Text(
              "Our Mission is to lower the barrier of entry and empower businesses across Africa, to succeed and subsequently grow the African economy",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'raleway',
                  color: Color(0xFFF4F4F4)),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            ),
            Text(
              "Our Vision is to become the most trusted and comprehensive online directory of niche websites in Africa, connecting users with the information and resources they need, when they need them.",
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'raleway',
                  color: Color(0xFFF4F4F4)),
              textAlign: TextAlign.left,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "For Businesses",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: Color(0xFF65DAFF),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                MissionMobileIconText(text: 'Boost your visibility & reach'),
                MissionMobileIconText(text: 'Target qualified leads'),
                MissionMobileIconText(text: 'Build brand reputation'),
                MissionMobileIconText(text: 'Grow with data & insights'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "For the Public",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: Color(0xFF65DAFF),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                RightMobileTextIcon(text: 'Find specific services fast'),
                RightMobileTextIcon(text: 'Support verified businesses'),
                RightMobileTextIcon(
                    text:
                        'Make informed decisions based on accurate information'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
