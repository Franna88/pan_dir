import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryContainer.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/LandingPageMobile/categorySelectMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/WebDirectories/Page1/LandingPage/LandingPageComponents/splashScreen.dart';
import 'package:webdirectories/myutility.dart';
// Uncomment the import below if CircleTextBoxMobile is needed
// import 'package:webdirectories/Mobile/MobilePage1/LandingPageMobile/circleTextBoxMobile.dart';

List directoriesInfo = [
  {
    "1title": "Download\n",
    "2title": "WATIF",
    "description":
        "Download the FREE WATIF App for instant access to nationwide fuel, tow, repair, and service information. Save time and money on your travels.",
    "buttonText": "Learn More",
    "url": ""
  },
  {
    "1title": "TOWING\n",
    "2title": "Directory",
    "description":
        "Professional help and roadside assistance in an emergency. Or find any specialist service nationwide. Read Reviews",
    "buttonText": "View Directory",
    "url": "https://www.towingdirectory.co.za/"
  },
  {
    "1title": "FUEL\n",
    "2title": "Directory",
    "description":
        "Locate and Navigate to the Nearest-, Cheapest-, or Specific Fuel Brand. Get fuel prices, rewards, coffee, food, toilets, shops, ATM’s and all other services nationwide.",
    "buttonText": "View Directory",
    "url": "https://www.fueldirectory.co.za/"
  },
  {
    "1title": "PANEL BEATER\n",
    "2title": "Directory",
    "description":
        "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your Insurance. Read Reviews.",
    "buttonText": "View Directory",
    "url": "/panelbeaters-directory"
  },
  {
    "1title": "AUTO REPAIR\n",
    "2title": "Directory",
    "description":
        "Locate qualified services nearby or nationwide, for service, spares, or specialist repairs. Read Reviews.",
    "buttonText": "View Directory",
    "url": "https://autorepairdirectory.co.za/"
  },
];
double dialIndex = -0.31;

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int menuIndex = 0;

  final PageController _pageController = PageController();
  bool _iconVisible = true;
  Timer? _flickerTimer;
  bool _buttonFlash = false;

void _startButtonBlinking() {
  Timer.periodic(Duration(milliseconds: 500), (timer) {
    setState(() {
      _buttonFlash = !_buttonFlash;
    });
  });
}

@override
void initState() {
  super.initState();
  _controller = AnimationController(
    lowerBound: -0.6,
    duration: const Duration(milliseconds: 2000),
    vsync: this,
  );
  _controller.animateTo(-0.35);

  // Start blinking when the page loads
  _startButtonBlinking();
}

@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
  // Update menu index
  changeMenu(int value) {
    print(value);
    if (value > -1 && value < 5) {
      setState(() {
        menuIndex = value;
      });
    }

    if (value == 0) {
      setState(() {
        dialIndex = -0.31;
      });
    }

    switch (value) {
      case 0:
        _controller.animateTo(-0.31);
        break;
      case 1:
        _controller.animateTo(-0.15);
        break;

      case 2:
        setState(() {
          dialIndex = 0.0;
          _controller.animateTo(0.0);
        });
        break;

      case 3:
        setState(() {
          dialIndex = 0.17;
          _controller.animateTo(0.17);
        });
        break;

      case 4:
        setState(() {
          dialIndex = 0.325;
          _controller.animateTo(0.325);
        });
        break;
    }
    /* */
  }

  // @override
  // void initState() {
  //   _controller = AnimationController(
  //     lowerBound: -0.6,
  //     duration: const Duration(milliseconds: 2000),
  //     vsync: this,
  //   );
  //   _controller.animateTo(-0.35);
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _flickerTimer?.cancel();
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      animationPath: 'images/webDirLogo.png',
      child: Container(
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/webDirMobileLanding.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            MobileTopNavBarhome(),
            CategorySelectMobile(
              menuIndex: menuIndex < 0 ? 5 : menuIndex,
              changeMenu: changeMenu,
              dialIndex: dialIndex,
              animateController: _controller,
            ),
            SizedBox(height: 15),
            DirectoryContainer(
              Title1: directoriesInfo[menuIndex]['1title'],
              Title2: directoriesInfo[menuIndex]['2title'],
              description: directoriesInfo[menuIndex]['description'],
              viewdirctoriesbutton: directoriesInfo[menuIndex]['buttonText'],
              menuIndex: menuIndex,
              changeMenu: changeMenu,
              url: directoriesInfo[menuIndex]['url'],
              onpress: () {},
              pageController: _pageController,
              buttonFlash: _buttonFlash, // Pass the updated blinking state
            ),
            // Uncomment the code below if CircleTextBoxMobile is needed
            // CircleTextBoxMobile(
            //   Title1: directoriesInfo[menuIndex]['1title'],
            //   Title2: directoriesInfo[menuIndex]['2title'],
            //   description: directoriesInfo[menuIndex]['description'],
            //   menuIndex: menuIndex,
            // ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
