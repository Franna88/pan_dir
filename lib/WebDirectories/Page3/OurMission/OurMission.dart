import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page3/OurMission/OurMissionComponent/EagleTeam.dart';
import 'package:webdirectories/WebDirectories/Page3/OurMission/OurMissionComponent/OurMissionIconText.dart';
import 'package:webdirectories/myutility.dart';

class OurMission extends StatefulWidget {
  const OurMission({super.key});

  @override
  State<OurMission> createState() => _OurMissionState();
}

class _OurMissionState extends State<OurMission> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Stack(
        children: [
          // Main content: existing Row and Columns
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Column: Our Mission and Vision text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MyUtility(context).height * 0.1),
                  const Text(
                    "Our Mission & Vision",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaybold',
                      color: Color(0xFF65DAFF),
                    ),
                  ),
                  const Text(
                    "#WeConnect",
                    style: TextStyle(
                      fontSize: 46,
                      fontFamily: 'ralewaysemi',
                      color: Color(0xFFFBFBFB),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width / 4.0,
                    child: const Text(
                      "Our Mission is to lower the barrier of entry and empower businesses across Africa, to succeed and subsequently grow the African economy.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                  SizedBox(height: MyUtility(context).height * 0.025),
                  SizedBox(
                    width: MyUtility(context).width / 3.5,
                    child: const Text(
                      "Our Vision is to become the most trusted and comprehensive online directory of niche websites in Africa, connecting users with the information and resources they need, when they need them.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                  SizedBox(height: MyUtility(context).height * 0.025),
                  // Sections for businesses and public
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width / 6.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "For Businesses",
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'ralewaybold',
                                color: Color(0xFF65DAFF),
                              ),
                            ),
                            SizedBox(height: MyUtility(context).height * 0.025),
                            const OurMissionIconText(
                                text: 'Boost your visibility & reach'),
                            const OurMissionIconText(
                                text: 'Target qualified leads'),
                            const OurMissionIconText(
                                text: 'Build brand reputation'),
                            const OurMissionIconText(
                                text: 'Grow with data & insights'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          width: MyUtility(context).width / 6.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "For the Public",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'ralewaybold',
                                  color: Color(0xFF65DAFF),
                                ),
                              ),
                              SizedBox(
                                  height: MyUtility(context).height * 0.025),
                              const OurMissionIconText(
                                  text: 'Find specific services fast'),
                              const OurMissionIconText(
                                  text: 'Support verified businesses'),
                              const OurMissionIconText(
                                  text:
                                      'Make informed decisions based on accurate\ninformation'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MyUtility(context).width / 5.5,
                    height: MyUtility(context).height * 0.45,
                    child: Image.asset('images/laptop2.png'),
                  ),
                  SizedBox(height: MyUtility(context).height * 0.04),
                  Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.08,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              "65M",
                              style: TextStyle(
                                fontSize: 32,
                                color: Color(0xFFFBFBFB),
                                fontFamily: 'ralewaysemi',
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              "Unique Views",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFBFBFB),
                                fontFamily: 'raleway',
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: MyUtility(context).height * 0.06,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Column(
                                  children: [
                                    Text(
                                      "8",
                                      style: TextStyle(
                                          fontFamily: 'ralewaysemi',
                                          fontSize: 32,
                                          color: Color(0xFFFBFBFB)),
                                    ),
                                    Text(
                                      "Countries",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFFBFBFB),
                                        fontFamily: 'raleway',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              width: 0.5,
                              height: MyUtility(context).height * 0.125,
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: MyUtility(context).height * 0.1,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.06,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "1765",
                              style: TextStyle(
                                  fontFamily: 'ralewaysemi',
                                  fontSize: 32,
                                  color: Color(0xFFFBFBFB)),
                            ),
                            const Text(
                              "Cities &\nSuburbs",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFBFBFB),
                                fontFamily: 'raleway',
                              ),
                            ),
                            SizedBox(
                              height: MyUtility(context).height * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: MyUtility(context).height * 0.5),
                  SizedBox(
                    width: MyUtility(context).width / 4.8,
                    height: MyUtility(context).height * 0.4,
                    child: Image.asset('images/buisnessman.png'),
                  ),
                  SizedBox(height: MyUtility(context).height * 0.1),
                ],
              ),
            ],
          ),

          Positioned(
              top: MyUtility(context).height * 0.2,
              left: MyUtility(context).width * 0.61,
              child: EagleTeam()),
        ],
      ),
    );
  }
}
