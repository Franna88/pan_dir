import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page7/GetinTouch/GetinTouch.dart';
import 'package:webdirectories/WebDirectories/Page7/Maps/Maps.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [TopNavBar(), GetinTouch(), Maps(), Footer()],
        ),
      ),
    );
  }
}
