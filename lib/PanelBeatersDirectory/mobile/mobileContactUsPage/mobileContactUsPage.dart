import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileContactUsPage/mobileContactForm.dart';

class MobileContactUsPage extends StatefulWidget {
  const MobileContactUsPage({super.key});

  @override
  State<MobileContactUsPage> createState() => _MobileContactUsPageState();
}

class _MobileContactUsPageState extends State<MobileContactUsPage> {
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
                                      height: 70,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              child: SizedBox(
                                child: Container(
                                  width: widthDevice * 0.90,
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
                                  child: MobileContactForm(),
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
                    right: widthDevice < 1600 ? 2 : 21,
                    bottom: heightDevice > 1049 ? 30 : 0,
                    child: SvgPicture.asset(
                      'images/gear3.svg',
                      height: heightDevice / 6.4,
                    )),
              ],
            ),
            PanFooterMobile()
          ],
        ),
      ),
    );
  }
}
