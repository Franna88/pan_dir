import 'package:flutter/material.dart';

import '../WelcomeComponents/CommonColor.dart';
import '../WelcomeComponents/PanOwnSocialLogs.dart';

class PanOwnSocialFooter extends StatefulWidget {
  const PanOwnSocialFooter({super.key});

  @override
  State<PanOwnSocialFooter> createState() => _PanOwnSocialFooterState();
}

class _PanOwnSocialFooterState extends State<PanOwnSocialFooter> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: widthDevice,
        height: 250,
        color: CommonColor().Colors4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SOCIAL LOGOS:
                    PanOwnSocialLogs(
                      imagePath: 'images/facebook.png',
                    ),
                    PanOwnSocialLogs(
                      imagePath: 'images/linked_in.png',
                    ),
                    PanOwnSocialLogs(
                      imagePath: 'images/insta.png',
                    ),
                    PanOwnSocialLogs(
                      imagePath: 'images/youtube.png',
                    ),
                  ],
                ),
              ),
              Text(
                '2024 Copyright Web Directories',
                style: TextStyle(fontSize: 12, color: CommonColor().Colors1),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 800,
                  child: Divider(
                    color: CommonColor().Colors3,
                    thickness: 2,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 12, color: CommonColor().Colors1),
                  children: <TextSpan>[
                    const TextSpan(
                      text:
                          'You are receiving this mail because you registered to join the Auto Repair Directory, a division of Web Directories (Pty) Ltd. This also shows that you agree to our',
                    ),
                    TextSpan(
                      text: ' Terms of Use & Privacy Policies. ',
                      style: TextStyle(
                          color: CommonColor().Colors6,
                          decoration: TextDecoration.underline),
                    ),
                    const TextSpan(
                      text:
                          'If you no longer want to receive mails from use, please click the unsubscribe button below.\n\n\n',
                    ),
                    TextSpan(
                      text: 'Unsubscribe',
                      style: TextStyle(
                          color: CommonColor().Colors6,
                          decoration: TextDecoration.underline),
                    ),
                    const TextSpan(
                      text: ' from our mails.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
