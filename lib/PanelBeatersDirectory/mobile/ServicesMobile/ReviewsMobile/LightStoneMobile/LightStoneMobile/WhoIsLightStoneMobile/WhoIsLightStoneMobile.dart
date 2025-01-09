import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

import 'WhoIsLightStoneCompMobile/ColumnContainerMobile.dart';

class WhoIsLightStoneMobile extends StatefulWidget {
  const WhoIsLightStoneMobile({super.key});

  @override
  State<WhoIsLightStoneMobile> createState() => _WhoIsLightStoneMobileState();
}

class _WhoIsLightStoneMobileState extends State<WhoIsLightStoneMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Who is Lightstone?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.4,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.8,
          height: MyUtility(context).height * 0.25,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      'The Lightstone EchoMBR Rankings are informed by data collected through actual customer feedback. Lightstone identifies auto body repairers that perform well. These results give the South African consumer trustworthy choices during an inherently difficult period after a motor accident.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyle(
                    color: Color(0xFF0BA3F9),
                    fontSize: 15.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '(Read More).',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: 15.64,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: MyUtility(context).width * 1.4,
              child: ColumnContainerMobile(
                section1Texts: [
                  'LS KAI',
                  'FRFT',
                  'Advocacy',
                  'Staff',
                  'Kept Informed',
                  'OI',
                  'VC',
                  'ROT',
                  'RQ',
                ],
                section2Texts: [
                  'Key Attribute Index',
                  'Fix a Vehicle Right, First Time',
                  'MBR Recommendation',
                  'Professionalism & Friendliness',
                  'Keep Customer Informed',
                  'Opportunity to Inspect ',
                  'Vehicle Cleanliness',
                  'Fix a Vehicle to be Ready On Time',
                  'Repair Quality'
                ],
                section3Texts: [
                  '98%',
                  '96%',
                  '96%',
                  '94%',
                  '100%',
                  '100%',
                  '100%',
                  '100%',
                  '98%'
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
