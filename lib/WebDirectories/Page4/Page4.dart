import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page4/DownloadWatif/DownloadWatif.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page4/Watif/Watif.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [TopNavBar(), Watif(), DownloadWatif(), Footer()],
        ),
      ),
    );
  }
}
