import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/category/mobileCategory.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/approvalsServices/mobileApprovalsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/areaSearch/mobileFindAllPanelBeaters.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileFuelTowing.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileNews.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/menus/menuItems/mobileWatifMenu.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileGlassContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/weConnectMainPage/weConnectMainPage.dart';

class Mobilelandingpage extends StatefulWidget {
  const Mobilelandingpage({
    super.key,
  });

  @override
  State<Mobilelandingpage> createState() => _MobilelandingpageState();
}

class _MobilelandingpageState extends State<Mobilelandingpage> {
  int menuIndex = 0;
  late List<Widget> menuContainers;

  @override
  void initState() {
    menuContainers = [
      const Mobilewatifmenu(),
      const MobileFindAllPanelBeaters(),
      const MobileApprovalsServices(),
      const MobileNews(),
      const MobileFuelTowing()
    ];
    super.initState();
  }

  PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: heightDevice,
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/mobileLanding.png'),
                    fit: BoxFit.cover),
              ),
              child: PageView(
                controller: _pageController,
                children: [
                  // Add the WeConnectMainPage here
                  WeConnectMainPageMobile(),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MobileTopNavBarhome(),
                        MobileCategorySelect(
                          menuIndex: menuIndex,
                          changeMenu: (value) {
                            setState(() {
                              menuIndex = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Mobileglasscontainer(
                              child: menuContainers[menuIndex]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PanFooterMobile()
          ],
        ),
      ),
    );
  }
}
