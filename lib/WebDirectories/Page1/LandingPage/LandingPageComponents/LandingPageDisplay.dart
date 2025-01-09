import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPage.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/LandingPageTextButton.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/categorySelect.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/circleTextBox.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/splashScreen.dart';
import 'package:webdirectories/WebDirectories/Page1/Page1.dart';
import 'package:webdirectories/WebDirectories/Page2/Page2.dart';
import 'package:webdirectories/WebDirectories/Page3/OurStory/OurSotryComponents/OvalTextButton.dart';
import 'package:webdirectories/WebDirectories/Page3/Page3.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/WebDirectories/Page5/Page5.dart';
import 'package:webdirectories/WebDirectories/Page7/Page7.dart';
import 'package:webdirectories/myutility.dart';
import 'dart:html' as html;

final uri = html.window.location.href;
final newUrl = '${uri.substring(0, uri.length - 1)}';

List directoriesInfo = [
  {
    "1title": "Download ",
    "2title": "WATIF",
    "description":
        "Download the FREE WATIF App for instant access to nationwide fuel, tow, repair, and service information. Save time and money on your travels.",
    "url": ""
  },
  {
    "1title": "TOWING ",
    "2title": "Directory",
    "description":
        "Professional help and roadside assistance in an emergency. Or find any specialist service nationwide.  Read Reviews.",
    "url": "https://www.towingdirectory.co.za/"
  },
  {
    "1title": "FUEL ",
    "2title": "Directory",
    "description":
        "Locate and Navigate to the Nearest-, Cheapest-, or Specific Fuel Brand. Get fuel prices, rewards, coffee, food, toilets, shops, ATM’s and all other services nationwide. Read Reviews.",
    "url": "https://www.fueldirectory.co.za/"
  },
  {
    "1title": "PANEL BEATER ",
    "2title": "Directory",
    "description":
        "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your Insurance. Read Reviews.",
    "url": "${newUrl}/panelbeaters-directory"
  },
  {
    "1title": "AUTO REPAIR ",
    "2title": "Directory",
    "description":
        "Locate qualified services nearby or nationwide, for service, spares, or specialist repairs. Read Reviews.",
    "url": "https://autorepairdirectory.co.za/"
  },
];

class LandingPageDisPlay extends StatefulWidget {
  const LandingPageDisPlay({super.key});

  @override
  State<LandingPageDisPlay> createState() => _LandingPageDisPlayState();
}

class _LandingPageDisPlayState extends State<LandingPageDisPlay> {
  int menuIndex = 0;
  bool _isFlickering = false;

  bool _iconVisible = true;
  Timer? _flickerTimer;

  @override
  void initState() {
    // Preload the background image
    // precacheImage(AssetImage("images/newwebcover_updated.png"), context);

    super.initState();
  }

  void _startFlicker() {
    if (_flickerTimer != null) return;

    setState(() => _isFlickering = true);

    // Set up a timer to toggle visibility for the flicker effect
    _flickerTimer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        _iconVisible = !_iconVisible;
      });
    });

    // Stop the flickering after a short duration
    // Future.delayed(Duration(seconds: 3), () {
    //   _stopFlicker();
    // });
  }

  void _stopFlicker() {
    _flickerTimer?.cancel();
    _flickerTimer = null;
    setState(() {
      _isFlickering = false;
      _iconVisible = true; // Ensure icon is visible when stopping
    });
  }

  @override
  void dispose() {
    _flickerTimer?.cancel();
    super.dispose();
  }

//update menu index
  changeMenu(value) {
    setState(() {
      menuIndex = value;
    });
  }

//change page
  navigateToDifrentPage(page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      animationPath: 'images/webDirLogo.png',
      child: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("images/newwebcover_updated.png").image,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, top: 15),
                  child: Image.asset(
                    'images/webDirLogo.png',
                    width: 225,
                    height: 110,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: SizedBox(
                    width: MyUtility(context).width * 0.3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LandingPageTextButton(
                            onpress: () {
                              navigateToDifrentPage(Material(child: Page1()));
                            },
                            text: 'Home'),
                        LandingPageTextButton(
                            onpress: () {
                              navigateToDifrentPage(Material(child: Page3()));
                            },
                            text: 'Our Story'),
                        LandingPageTextButton(
                            onpress: () {
                              navigateToDifrentPage(Material(child: Page4()));
                            },
                            text: 'Watif'),
                        LandingPageTextButton(
                          onpress: () {
                            navigateToDifrentPage(Material(child: Page5()));
                          },
                          text: 'Articles',
                          isComingSoon: true,
                        ),
                        Spacer(),
                        OvalTextButton(
                            text: 'Get in Touch',
                            onPressed: () {
                              navigateToDifrentPage(Material(child: Page7()));
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),

            //TODO JACO Start here
            Stack(
              alignment: Alignment.center, // Center items within the Stack
              children: [
                // Main Row layout that holds the left and right columns
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left Column
                    Column(
                      children: [
                        SizedBox(height: 17),
                        CategorySelect(
                          startFlickering: _startFlicker,
                          menuIndex: menuIndex,
                          changeMenu: changeMenu,
                        ),
                      ],
                    ),

                    // Right Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleTextBox(
                          Title1: directoriesInfo[menuIndex]['1title'],
                          Title2: directoriesInfo[menuIndex]['2title'],
                          url: directoriesInfo[menuIndex]['url'],
                          description: directoriesInfo[menuIndex]
                              ['description'],
                          changeMenu: changeMenu,
                          menuIndex: menuIndex,
                          buttonFlash: _iconVisible,
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),

                // Centered Row with SVG icons, positioned absolutely within the Stack
                Positioned(
                  top: 0, // Adjust the top position if needed
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'images/left_arrow.svg',
                          width: 40,
                        ),
                        SizedBox(width: 50),
                        SvgPicture.asset('images/light_indicator.svg',
                            width: 35),
                        SizedBox(width: 50),
                        AnimatedOpacity(
                            opacity: _iconVisible ? 1.0 : 0.2,
                            duration: Duration(milliseconds: 100),
                            child: SvgPicture.asset('images/right_arrow.svg',
                                width: 40)),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
