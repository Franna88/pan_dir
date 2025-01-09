import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page2/WebsiteDisclaimer.dart/WebsiteDisclaimer.dart';

class MobileDisclaimer extends StatefulWidget {
  const MobileDisclaimer({super.key});

  @override
  State<MobileDisclaimer> createState() => _MobileDisclaimerState();
}

class _MobileDisclaimerState extends State<MobileDisclaimer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [MobileTopNavBar(), WebsiteDisclaimer(), FooterMobile()],
        ),
      ),
    );
  }
}
