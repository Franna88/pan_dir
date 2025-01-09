import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/AboutUsMobile/AboutUsMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/AiCoDriverMobile/AiCoDriverMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/CommentsMobile/CommentsMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/CommentsMobile/CommentsSliderMobile/CommentsSliderMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryContainer.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryScroll.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/JoinUsMobile/JoinUsMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/LandingPageMobile/landingPageMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/PartnerWithUs/PartnerWithUsMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page1/AboutUS/AboutUs.dart';
import 'package:webdirectories/myutility.dart';

class MobilePage1 extends StatefulWidget {
  const MobilePage1({super.key});

  @override
  State<MobilePage1> createState() => _MobilePage1State();
}

class _MobilePage1State extends State<MobilePage1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            LandingPageMobile(),
            Image.asset('images/mobileglasses.png'),
            PartnerWithUsMobile(),
            AboutUsMobile(),
            JoinUsMobile(),
            SizedBox(
              height: MyUtility(context).height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Image.asset('images/3mobile.png'),
            ),
            AiCoDriverMobile(),
            CommentsSliderMobile(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
