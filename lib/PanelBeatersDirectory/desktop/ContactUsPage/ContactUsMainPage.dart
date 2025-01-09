import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/myutility.dart';

import 'ui/ContactDesktop.dart';

class ContactUsMainPage extends StatefulWidget {
  const ContactUsMainPage({super.key});

  @override
  State<ContactUsMainPage> createState() => _ContactUsMainPageState();
}

class _ContactUsMainPageState extends State<ContactUsMainPage> {
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
                      height: heightDevice,
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
                                  horizontal: 0, vertical: 10),
                              child: SizedBox(
                                width: widthDevice * 0.82,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 0, top: 50),
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
                            SizedBox(
                              child: Container(
                                width: widthDevice * 0.90,
                                height: heightDevice * 0.78,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF181B1D),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 0.64,
                                      strokeAlign:
                                          BorderSide.strokeAlignOutside,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(9.57),
                                  ),
                                ),
                                child: ContactDesktop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    right: widthDevice < 1600 ? 2 : 21,
                    bottom: heightDevice > 1049 ? 30 : 0,
                    child: SvgPicture.asset(
                      'images/gear3.svg',
                      height: heightDevice / 6.4,
                    )),
              ],
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
