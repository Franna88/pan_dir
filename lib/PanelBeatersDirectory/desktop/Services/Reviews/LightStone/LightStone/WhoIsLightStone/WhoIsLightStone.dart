import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'WhoIsLightStoneComp/columnContainer.dart';

class WhoIsLightStone extends StatefulWidget {
  final Map<String, dynamic> data;
  const WhoIsLightStone({super.key, required this.data});

  @override
  State<WhoIsLightStone> createState() => _WhoIsLightStoneState();
}

class _WhoIsLightStoneState extends State<WhoIsLightStone> {
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
            fontSize: MyUtility(context).width * 0.0165,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          width: 541.28,
          height: 113.56,
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
                    fontSize: MyUtility(context).width * 0.012,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: '(Read More).',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: MyUtility(context).width * 0.012,
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
        ColumnContainer(
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
            widget.data['lightstoneScore'].toString(),
            widget.data['frft'].toString(),
            widget.data['advocacy'].toString(),
            widget.data['staff'].toString(),
            widget.data['consultant'].toString(),
            widget.data['opportunityInspect'].toString(),
            widget.data['vehicleCleanliness'].toString(),
            widget.data['rot'].toString(),
            widget.data['repairQuality'].toString(),
          ],
        )
      ],
    );
  }
}
