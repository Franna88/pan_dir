import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page1/AboutUS/AboutUsComponents/AboutUsButton.dart';
import 'package:webdirectories/myutility.dart';

import '../../Page7/Page7.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: MyUtility(context).width / 3.5,
            height: MyUtility(context).height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "About us",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Color(0xFF65DAFF)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: SizedBox(
                    width: MyUtility(context).width / 3.5,
                    child: const Text(
                      "Empowering informed decisions across Africa",
                      style: TextStyle(
                          fontSize: 42,
                          height: 1.2,
                          fontFamily: 'ralewaysemi',
                          color: Color(0xFFFBFBFB)),
                    ),
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: const Text(
                    "Driven by passion and innovation, Web Directories\nemerged in 2013 to bridge the online information gap in\nSouth Africa, starting with comprehensive automotive\ndirectories and growing into a leading online business\nresource for businesses and the public.",
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Color(0xFFF4F4F4),
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  child: Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width / 7,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "11 200+",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'ralewaysemi',
                                  color: Color(0xFF65DAFF)),
                            ),
                            Text(
                              "Profiles",
                              style: TextStyle(
                                fontSize: 14.5,
                                color: Color(0xFFF4F4F4),
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MyUtility(context).width / 7,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "10+",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: 'ralewaysemi',
                                  color: Color(0xFF65DAFF)),
                            ),
                            Text(
                              "Years in Service",
                              style: TextStyle(
                                fontSize: 14.5,
                                color: Color(0xFFF4F4F4),
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.02,
                ),
                AboutUsButton(
                    buttonText: 'Contact Us',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Material(
                                    child: Page7(),
                                  )));
                    }),
              ],
            ),
          ),
          Container(
            width: MyUtility(context).width / 2.5,
            height: MyUtility(context).height * 0.9,
            child: Image.asset('images/stackimage.png'),
          )
        ],
      ),
    );
  }
}
