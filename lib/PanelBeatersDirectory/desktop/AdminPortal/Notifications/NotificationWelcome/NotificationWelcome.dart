import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/BackButtonMessage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationWelcome/OwnWelcomeUi/OwnMailAppBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationWelcome/WelcomeComponents/OwnCustomButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

import '../../Dashboard/DashboardContainers/DashProfileView.dart';
import 'OwnWelcomeUi/OwnFtMessageText.dart';
import 'OwnWelcomeUi/PanOwnGettingStart.dart';
import 'OwnWelcomeUi/PanOwnNeedHelp.dart';
import 'OwnWelcomeUi/PanOwnSocialFooter.dart';
import 'WelcomeComponents/CommonColor.dart';
import 'WelcomeComponents/OwnMessageText.dart';

class NotificationWelcome extends StatefulWidget {
  final Function(int) navigateToPage;

  const NotificationWelcome({super.key, required this.navigateToPage});

  @override
  State<NotificationWelcome> createState() => _NotificationWelcomeState();
}

class _NotificationWelcomeState extends State<NotificationWelcome> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: 1487,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.57, -0.82),
                    end: Alignment(-0.57, 0.82),
                    colors: [
                      Color(0x19777777),
                      Colors.white.withOpacity(0.4000000059604645)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      BackButtonMessage(
                        onPress: () {
                          widget.navigateToPage(5);
                        },
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.02,
                      ),
                      const OwnMailAppBar(),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Spraybooth 2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: widthDevice,
                        height: heightDevice,
                        child: Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 100, bottom: 60),
                                child: Container(
                                  alignment: const Alignment(0, 0),
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        Color(0xFFFD9C32),
                                        Color(0xFFFF6D00),
                                      ],
                                      center: Alignment.center,
                                      radius: 0.8,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('images/tool.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              OwnMessageText(
                                text: 'Welcome To The',
                                fontSize: widthDevice < 1500 ? 60 : 80,
                                textColor: CommonColor().Colors1,
                              ),
                              OwnMessageText(
                                text: 'Auto Repair Directory',
                                fontSize: widthDevice < 1500 ? 60 : 80,
                                textColor: CommonColor().Colors2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(45.0),
                                child: OwnCustomButton(
                                  text: 'Login to Owners Portal',
                                  fontSize: 22,
                                  onPressed: () {},
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      // Owners features text file goes here
                      const OwnFtMessageText(),
                      const PanownGettingStart(),
                      const PanOwnNeedHelp(),
                      const PanOwnSocialFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
