import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/GetinTouchMobile/GetinTouchMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MessageUsMobile/MessageUsMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page7/Maps/Maps.dart';

class MobilePage6 extends StatefulWidget {
  const MobilePage6({super.key});

  @override
  State<MobilePage6> createState() => _MobilePage6State();
}

class _MobilePage6State extends State<MobilePage6> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            MobileTopNavBar(),
            GetinTouchMobile(),
            MessageUsMobile(),
            Maps(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
