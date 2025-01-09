import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/panelBeatersHome.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/myutility.dart';
import 'dart:html' as html;

class CircleTextBox extends StatefulWidget {
  bool buttonFlash;
  String Title1;
  String Title2;
  String description;
  String url;
  int menuIndex;
  Function(int) changeMenu;

  CircleTextBox({
    super.key,
    required this.Title1,
    required this.Title2,
    required this.description,
    required this.url,
    required this.menuIndex,
    required this.changeMenu,
    required this.buttonFlash,
  });

  @override
  State<CircleTextBox> createState() => _CircleTextBoxState();
}

class _CircleTextBoxState extends State<CircleTextBox> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    changeIndex() {
      setState(() {
        var value = widget.menuIndex + 1;
        widget.changeMenu(value);
      });
    }

    goToLink(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        // Handle error if URL cannot be launched
        print('Could not launch $url');
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 0, right: 50),
      child: Container(
        width: 500,
        height: 550,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 2, 27, 43),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2.5,
          ),
        ),
        child: Container(
          width: 500,
          height: 500,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color.fromARGB(255, 14, 16, 19),
              width: 38.0,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "<  ",
                      style: TextStyle(
                          fontSize: 22,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Text(
                      "${widget.menuIndex + 1} / 5 ",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "  >",
                        style: TextStyle(
                            fontSize: 22,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 350,
                  child: Container(
                    height:
                        90, // Fixed height for Title section to avoid hopping
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.Title1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'ralewaybold',
                            color: const Color.fromARGB(255, 255, 255, 255),
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                            height: 4), // Reduced gap between Title1 and Title2
                        Text(
                          widget.Title2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'raleway',
                            color: const Color.fromARGB(255, 255, 255, 255),
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /* Retained Commented Out Code
                SizedBox(
                  width: MyUtility(context).width / 5.2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.Title1,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'ralewaybold',
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.Title2,
                          style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'raleway',
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ],
                    ),
                  ),
                ),
                */

                SizedBox(
                  width: MyUtility(context).width / 4.5,
                  height: MyUtility(context).height * 0.195,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: MyUtility(context).width < 1500 ? 16 : 18,
                            fontFamily: 'raleway',
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // width: MediaQuery.of(context).size.width * 0.1,
                  // height: MediaQuery.of(context).size.height * 0.05,
                  child: AnimatedContainer(
                    decoration: BoxDecoration(
                      color: widget.buttonFlash
                          ? Colors.white
                          : Colors.green, // Flash colors
                      borderRadius: BorderRadius.circular(
                          20), // Match the button's corner radius
                    ),
                    duration: Duration(milliseconds: 200), // Animation duration
                    onEnd: () {
                      // Trigger continuous flashing by toggling the state
                      if (widget.buttonFlash) {
                        setState(() {
                          widget.buttonFlash = !widget.buttonFlash;
                        });
                      }
                    },
                    child: TextButton(
                      onPressed: () {
                        if (widget.Title2 == "WATIF") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Material(
                                child: Page4(),
                              ),
                            ),
                          );
                        } else if (widget.Title1 == "PANEL BEATER ") {
                          // Open the PanelBeatersHome page in a new tab using the named route URL
                          html.window.open('/panelbeaters-directory', '_blank');
                        } else {
                          goToLink(widget.url);
                        }
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.keyboard_arrow_right_outlined,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            child: Text(
                              widget.Title2 == "WATIF"
                                  ? 'Learn More'
                                  : 'View Directory',
                              style: TextStyle(
                                color: Color(0xFF0C0C0C).withOpacity(0.9),
                                fontSize: 16.5,
                                fontFamily: 'Raleway',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
