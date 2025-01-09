import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/WatifMobile/WatifMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/AriclesSmallImageContainer.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticleMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/StackedArticleMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

class MobilePage4 extends StatefulWidget {
  const MobilePage4({super.key});

  @override
  State<MobilePage4> createState() => _MobilePage4State();
}

class _MobilePage4State extends State<MobilePage4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            MobileTopNavBar(),
            ArticleMobile(),
            StackedArticleMobile(),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
