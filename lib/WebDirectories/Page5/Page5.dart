import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page5/Productivity/Productivity.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/RecentAtricles.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [TopNavBar(), Productivity(), RecentArticles(), Footer()],
        ),
      ),
    );
  }
}
