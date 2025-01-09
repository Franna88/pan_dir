import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page6/EchoMBR/EchoMBR.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page6/UltimateBuisnessTool/BuisnessToolComponents/ESOTags.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/WebDirectories/Page6/UltimateBuisnessTool/UltimateBuisnessTool.dart';
import 'package:webdirectories/myutility.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopNavBar(),
          EchoMBR(),
          UltimateBuisnessTool(),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.1,
            child: Row(
              children: [
                ESOTags(text: 'Lightstone', onpress: () {}),
                ESOTags(text: 'EchoMBR', onpress: () {}),
                ESOTags(text: 'KAI Results', onpress: () {}),
                ESOTags(text: 'Panelbeaters', onpress: () {}),
              ],
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          Footer()
        ],
      ),
    );
  }
}
