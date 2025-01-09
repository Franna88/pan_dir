import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page3/Our%20Eagle%20Proclamation/OurEagleProclamation.dart';
import 'package:webdirectories/WebDirectories/Page3/OurMission/OurMission.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurStory.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurStoryExtention.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page3/WebDirectoriesWay/WebDirectoriesWay.dart';
import 'package:webdirectories/myutility.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            TopNavBar(),
            OurStory(),
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            OurStoryExtention(),
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            OurMission(),
            WebDirectoriesWay(),
            OurEagleProclamation(),
            Footer()
          ],
        ),
      ),
    );
  }
}
