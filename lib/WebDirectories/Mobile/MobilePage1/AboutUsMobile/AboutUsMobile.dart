import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AboutUsMobile extends StatefulWidget {
  const AboutUsMobile({super.key});

  @override
  State<AboutUsMobile> createState() => _AboutUsMobileState();
}

class _AboutUsMobileState extends State<AboutUsMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: MyUtility(context).width,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "About us",
              style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'ralewaysemi',
                  color: Color(0xFF65DAFF)),
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: Text(
              "Empowering informed\ndecisions across Africa",
              style: TextStyle(
                  fontSize: 39,
                  fontFamily: 'ralewaysemi',
                  height: 1.2,
                  color: Color(0xFFFBFBFB)),
              textAlign: TextAlign.right,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Driven by passion and innovation, Web Directories emerged in 2013 to bridge the information gap in South Africa, starting with comprehensive automotive directories and growing into a leading online business resource for businesses and the public.",
              style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'raleway',
                  color: Color(0xFFF4F4F4)),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Column(
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
                        fontSize: 18,
                        color: Color(0xFFFBFBFB),
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
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
                      fontSize: 18,
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
    );
  }
}
