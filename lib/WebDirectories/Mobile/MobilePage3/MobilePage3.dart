import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/WatifMobile/WatifMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

class MobilePage3 extends StatefulWidget {
  const MobilePage3({super.key});

  @override
  State<MobilePage3> createState() => _MobilePage3State();
}

class _MobilePage3State extends State<MobilePage3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [MobileTopNavBar(), WatifMobile(), FooterMobile()],
        ),
      ),
    );
  }
}
