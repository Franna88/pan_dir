import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/WhoIsLightStone/WhoIsLightStoneComp/columnContainer.dart';
import 'package:webdirectories/myutility.dart';

class AdminWhoisLight extends StatefulWidget {
  final Map<String, dynamic> data;
  const AdminWhoisLight({super.key, required this.data});

  @override
  State<AdminWhoisLight> createState() => _AdminWhoisLightState();
}

class _AdminWhoisLightState extends State<AdminWhoisLight> {
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
          width: MyUtility(context).width * 0.37,
          height: MyUtility(context).height * 0.165,
          child: GestureDetector(
            onTap: () async {
              final Uri uri = Uri.parse("https://corporate.lightstone.co.za/");
              await launchUrl(uri);
            },
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
                    text: '(Click to Read More).',
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
            ' ${widget.data['keyAttIndex']}%',
            ' ${widget.data['frft']}%',
            ' ${widget.data['advocacy']}%',
            ' ${widget.data['staff']}%',
            ' ${widget.data['keptInformed']}%',
            ' ${widget.data['opportunityToInspect']}%',
            ' ${widget.data['vehicleCleanliness']}%',
            ' ${widget.data['rot']}%',
            ' ${widget.data['repairQuality']}%',
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: AddButton(
              text: 'Login to Lightstone EchoMBR Portal',
              onPressed: () async {
                final Uri uri = Uri.parse(
                    "https://www.lightstoneproperty.co.za/content/login.aspx");
                await launchUrl(uri);
              }),
        )
      ],
    );
  }
}
