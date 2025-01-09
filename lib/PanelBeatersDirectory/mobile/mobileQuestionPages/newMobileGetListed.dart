import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileAttentionBlock.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileConvertClicks.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileGetListedBlock.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileYoutubeVidBlock.dart';

import '../MobileTopNavBar/MobileTopNavBarhome.dart';

class NewMobileGetListed extends StatefulWidget {
  const NewMobileGetListed({super.key});

  @override
  State<NewMobileGetListed> createState() => _NewMobileGetListedState();
}

class _NewMobileGetListedState extends State<NewMobileGetListed> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: heightDevice,
            width: widthDevice,
            decoration: BoxDecoration(
              color: Color(0xFF0E1013),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTopNavBarhome(),
                  const SizedBox(height: 25),
                  MobileYoutubeVidBlock(),
                  MobileGetListedBlock(),
                  const SizedBox(height: 25),
                  MobileConvertClicks(),
                  const SizedBox(height: 25),
                  MobileAttentionBlock(),
                  const SizedBox(height: 25),
                  PanFooterMobile()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
