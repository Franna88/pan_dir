import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/checkMarkedText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/stackedInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/weConnectText.dart';

class WeConnectMainPageMobile extends StatelessWidget {
  const WeConnectMainPageMobile({super.key});

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
                    image: AssetImage('images/mobileLanding.png'), fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MobileTopNavBarhome(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: widthDevice * 0.90,
                        decoration: ShapeDecoration(
                          color: Color(0xFF181B1D),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.64,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(9.57),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 25),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Need a Panel Beater?',
                                  style: TextStyle(
                                    color: Color(0xFFF19A41),
                                    fontSize: 22,
                                    fontFamily: 'ralewaybold',
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '#WeConnect',
                                  style: TextStyle(
                                    color: Color(0xFFFAFAFA),
                                    fontSize: 45,
                                    fontFamily: 'ralewaybold',
                                    height: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CheckMarkedText(
                                  text: 'Find specific services fast',
                                ),
                                CheckMarkedText(
                                  text: 'Support verified businesses',
                                ),
                                CheckMarkedText(
                                  text:
                                      'Make informed decisions based on accurate information',
                                ),
                                Container(
                                  height: heightDevice * 0.40,
                                  width: widthDevice,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('images/WeConnect.png'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Text(
                                  WeConnectText().description1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'raleway',
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  WeConnectText().description2,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'raleway',
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                StackedInfo()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PanFooterMobile()
          ],
        ),
      ),
    );
  }
}
