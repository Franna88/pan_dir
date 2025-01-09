import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/checkMarkedText.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/stackedInfo.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/weConnectPage/ui/weConnectText.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/routes/routerNames.dart';

class WeConnectMainPage extends StatefulWidget {
  final VoidCallback goToLandingPageDisplay;

  WeConnectMainPage({super.key, required this.goToLandingPageDisplay});

  @override
  _WeConnectMainPageState createState() => _WeConnectMainPageState();
}

class _WeConnectMainPageState extends State<WeConnectMainPage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Container(
                      height: heightDevice * 1.05,
                      width: widthDevice,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/mobileLanding.png'),
                            fit: BoxFit.cover),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 10),
                              child: SizedBox(
                                width: widthDevice * 0.82,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 50, top: 50),
                                    child: Image.asset(
                                      'images/panelLogo.png',
                                      // height: 70,
                                      width: MyUtility(context).width * 0.23,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: widthDevice * 0.82,
                              height: heightDevice * 0.78,
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
                                  horizontal: 15,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: widthDevice / 2.8,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Need a Panel Beater?',
                                                style: TextStyle(
                                                  color: Color(0xFFF19A41),
                                                  fontSize: 21,
                                                  fontFamily: 'ralewaybold',
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15, top: 0),
                                                child: Text(
                                                  '#WeConnect',
                                                  style: TextStyle(
                                                    color: Color(0xFFFAFAFA),
                                                    fontSize: widthDevice < 1600
                                                        ? 45
                                                        : 55,
                                                    fontFamily: 'ralewaysemi',
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: widthDevice * 0.38,
                                                child: Text(
                                                  WeConnectText().description1,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: widthDevice < 1600
                                                        ? 16
                                                        : 20,
                                                    fontFamily: 'raleway',
                                                    height: 1.2,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              SizedBox(
                                                width: widthDevice * 0.38,
                                                child: Text(
                                                  WeConnectText().description2,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: widthDevice < 1600
                                                        ? 16
                                                        : 20,
                                                    fontFamily: 'raleway',
                                                    height: 1.2,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CheckMarkedText(
                                                text:
                                                    'Find specific services fast',
                                              ),
                                              CheckMarkedText(
                                                text:
                                                    'Support verified businesses',
                                              ),
                                              CheckMarkedText(
                                                text:
                                                    'Make informed decisions based on accurate information',
                                              ),
                                            ]),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: widthDevice < 1600
                                                        ? 80
                                                        : 50,
                                                    left: 30),
                                                child: Container(
                                                  height: heightDevice * 0.63,
                                                  width: widthDevice * 0.35,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'images/WeConnect.png'),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                right: widthDevice == 1440
                                                    ? 260
                                                    : MyUtility(context).width *
                                                        0.19,
                                                top: 0,
                                                child: StackedInfo(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: widthDevice < 1600 ? 40 : 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHovered = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(Routernames.panelbeatersHome);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: heightDevice * 0.12,
                            color:
                                _isHovered ? Colors.white : Color(0xFFFF8828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: widthDevice < 1600 ? 40 : 60,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            _isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            _isHovered = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(Routernames.panelbeatersWeCanHelp);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            size: heightDevice * 0.12,
                            color:
                                _isHovered ? Colors.white : Color(0xFFFF8828),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
