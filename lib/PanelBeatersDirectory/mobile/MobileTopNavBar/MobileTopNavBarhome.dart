import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesNearMe/mobileServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/mobileLandingPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileContactUs/mobileContactUsMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileJobFinder/mobileJobFinder.dart';

import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/newMobileGetListed.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/mobileRecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/mainPageItems/ownersLoginMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ownersLoginMobile.dart';
import 'package:webdirectories/myutility.dart';

class MobileTopNavBarhome extends StatefulWidget {
  const MobileTopNavBarhome({Key? key}) : super(key: key);

  @override
  State<MobileTopNavBarhome> createState() => _MobileTopNavBarhomeState();
}

class _MobileTopNavBarhomeState extends State<MobileTopNavBarhome> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, right: 20),
          child: Container(
            width: 250,
            height: 50,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'images/panelLogo.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: PopupMenuButton<String>(
            icon: Icon(
              Icons.menu,
              size: 40,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) => [
              buildPopupMenuItem('Home', 'option1', Mobilelandingpage()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem('Job Finder', 'option2', MobileJobFinder()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem(
                  'More Services', 'option3', Mobilelandingpage()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem(
                  'News & Articles', 'option4', MobileRecentArticles()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem(
                  'Get Listed Today!', 'option5', NewMobileGetListed()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem('Owners Portal', 'option6', OwnersloginMain()),
              PopupMenuDivider(), // Grey divider
              buildPopupMenuItem(
                  'Contact Us', 'option7', MobileContactUsMain()),
            ],
            onSelected: (String value) {
              setState(() {
                selectedOption = value;
              });
            },
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenuItem(
      String text, String value, Widget route) {
    final isSelected = selectedOption == value;
    return PopupMenuItem<String>(
      value: value,
      child: Container(
        color: isSelected
            ? Color(0xE5D9D9D9).withOpacity(0.05)
            : Color(0xFFF1F3F4).withOpacity(0.05),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'raleway',
              fontSize: 18,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Material(child: route)),
            );
          },
        ),
      ),
    );
  }
}
