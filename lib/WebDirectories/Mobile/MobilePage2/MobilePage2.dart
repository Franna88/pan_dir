import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/EagleSliderMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/GoogleRaitingMobile/GoogleRankingMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/OurMissionMobile.dart/OurMissionMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/OurStoryMobile/OurStoryMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

class MobilePage2 extends StatefulWidget {
  const MobilePage2({super.key});

  @override
  State<MobilePage2> createState() => _MobilePage2State();
}

class _MobilePage2State extends State<MobilePage2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            MobileTopNavBar(),
            Image.asset('images/buisnesslight.png'),
            OurStoryMobile(),
            GoogleRankingMobile(),
            OurMissionMobile(),
            DirectoriesWayMobile(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
