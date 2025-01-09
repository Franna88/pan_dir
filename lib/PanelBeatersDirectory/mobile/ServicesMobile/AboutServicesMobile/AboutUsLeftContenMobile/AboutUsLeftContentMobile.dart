import 'package:flutter/material.dart';

import 'AboutUsLeftContentComp/AboutUSContainerInfoMobile.dart';

class AboutUsLeftContentMobile extends StatefulWidget {
  const AboutUsLeftContentMobile({super.key});

  @override
  State<AboutUsLeftContentMobile> createState() =>
      _AboutUsLeftContentMobileState();
}

class _AboutUsLeftContentMobileState extends State<AboutUsLeftContentMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoContainer(
          section1Texts: [
            'B-BBEE Levels',
            'VDQ Registration',
            'FixEezy Finance Option',
            'Lightstone Registration',
            'CRA Membership',
            'Fender Bender Finance',
            'Business Registration Number',
            'SAMBRA Membership'
          ],
          section2Texts: [
            'Level 49',
            '067ABC',
            'FX0000Test',
            '3167',
            '20268',
            '20268',
            '2013/123123/07',
            '12341234'
          ],
        ),
      ],
    );
  }
}
