import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page2/WebsiteDisclaimer.dart/WebsiteDisclaimer.dart';

import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [TopNavBar(), WebsiteDisclaimer(), Footer()],
        ),
      ),
    );
  }
}
