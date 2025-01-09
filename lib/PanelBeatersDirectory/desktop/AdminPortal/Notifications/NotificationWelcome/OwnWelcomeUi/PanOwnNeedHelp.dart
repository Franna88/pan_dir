import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

import '../WelcomeComponents/CommonColor.dart';

class PanOwnNeedHelp extends StatefulWidget {
  const PanOwnNeedHelp({super.key});

  @override
  State<PanOwnNeedHelp> createState() => _PanOwnNeedHelpState();
}

class _PanOwnNeedHelpState extends State<PanOwnNeedHelp> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: widthDevice,
        height: MyUtility(context).height * 0.47,
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 16, color: CommonColor().Colors5),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Need Help?\n\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                    TextSpan(
                        text:
                            'Our dedicated support team is happy to assist you. You can reach us by email admin@webdirectories.co.za or phone 012 403 0120.\n\n'),
                    TextSpan(
                      text:
                          '[Insert clients name] we’re confident that the Auto Repair Directory will become a valuable asset for your business. Stay tuned for exciting resources to help you maximize your membership!\n\n\n',
                    ),
                    TextSpan(
                      text: 'Sincerely,\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Text(
                'Thys Cronje (CEO) & the Web Directories Team',
                style: TextStyle(
                  color: Color(0xFFFF8728),
                  fontSize: 17.64,
                  fontFamily: 'Gloria',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
