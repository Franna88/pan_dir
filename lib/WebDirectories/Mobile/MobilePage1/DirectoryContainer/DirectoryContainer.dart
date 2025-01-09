import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileView.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/MobilePage3.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/MobilePage4.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage5/MobilePage5.dart';
import 'package:webdirectories/main.dart';
import 'package:webdirectories/myutility.dart';
import 'dart:html' as html;

import 'package:webdirectories/routes/routerNames.dart';

class DirectoryContainer extends StatefulWidget {
  String Title1;
  String Title2;
  String description;
  int menuIndex;
  Function(int) changeMenu;
  String url;
  final VoidCallback onpress;
  final PageController pageController;
  String viewdirctoriesbutton;
  bool buttonFlash;

  DirectoryContainer(
      {Key? key,
      required this.menuIndex,
      required this.Title1,
      required this.Title2,
      required this.description,
      required this.changeMenu,
      required this.onpress,
      required this.pageController,
      required this.url,
      required this.viewdirctoriesbutton,
      required this.buttonFlash})
      : super(key: key);

  @override
  State<DirectoryContainer> createState() => _DirectoryContainerState();
}

class _DirectoryContainerState extends State<DirectoryContainer> {
  goToLink(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error if URL cannot be launched
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.15,
      //height: 465,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  widget.pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      widget.changeMenu(widget.menuIndex - 1);
                      widget.pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 30,
                    padding: EdgeInsets.all(0),
                    splashRadius: 20,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.menuIndex + 1} / 5 ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right),
                    onPressed: () {
                      widget.changeMenu(widget.menuIndex + 1);
                      widget.pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    color: Colors.black,
                    iconSize: 30,
                    padding: EdgeInsets.all(0),
                    splashRadius: 20,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
            ],
          ),

          Center(
            child: SizedBox(
              width: MyUtility(context).width / 1.15,
              //height: MyUtility(context).height * 0.14,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'raleway',
                    fontSize: 40,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: widget.Title1,
                      style: TextStyle(
                        fontFamily: 'ralewaybold',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: widget.Title2,
                      style: TextStyle(
                        fontFamily: 'raleway',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Learn more button
          //blink button
          Row(
            children: [
              Spacer(),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: widget.buttonFlash
                      ? Colors.white
                      : Color.fromRGBO(101, 218, 255, 1), // Toggle colors
                  borderRadius: BorderRadius.circular(20),
                ),
                duration: Duration(
                    milliseconds: 500), // Match the periodic timer duration
                child: TextButton(
                  onPressed: () {
                    if (widget.Title1 == "PANEL BEATER\n") {
                      // Open the PanelBeatersHome page in a new tab using the named route URL
                      html.window.open('/panelbeaters-directory', '_blank');
                      return;
                    }
                    widget.Title2 == "WATIF"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Material(child: MobilePage3()),
                            ),
                          )
                        : goToLink(widget.url);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.all(1),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.viewdirctoriesbutton,
                          style: TextStyle(
                            fontFamily: 'raleway',
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.25,
            height: 200,
            child: Text(
              widget.description,
              style: TextStyle(
                fontFamily: 'raleway',
                fontSize: 20,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
