import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page1/AboutUS/AboutUs.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriver.dart';
import 'package:webdirectories/WebDirectories/Page1/Comments/Comments.dart';
import 'package:webdirectories/WebDirectories/Page1/JoinUs/JoinUs.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/LandingPageDisplay.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/categorySelect.dart';
import 'package:webdirectories/WebDirectories/Page1/PartnerWithUs/PartnerWithUs.dart';

import '../../SuperAdmin/superAdmin.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: // AdminPortal(),
          /**/ Column(
        children: [
          //  AdminPortal(),
          //SuperAdmin(),
          // CategorySelect(),
          /*  */ LandingPageDisPlay(),
          PartnerWithUs(),
          AboutUs(),
          JoinUs(),
          AiCoDriver(),
          Comments(),
          Footer()
        ],
      ),
    );
  }
}
