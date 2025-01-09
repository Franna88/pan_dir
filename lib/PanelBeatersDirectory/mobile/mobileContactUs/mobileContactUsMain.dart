import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileContactUs/ui/ContactUsTextBlock.dart';
import '../MobileTopNavBar/MobileTopNavBarhome.dart';
import 'ui/ContactColumnMobile.dart';

class MobileContactUsMain extends StatefulWidget {
  const MobileContactUsMain({super.key});

  @override
  State<MobileContactUsMain> createState() => _MobileContactUsMainState();
}

class _MobileContactUsMainState extends State<MobileContactUsMain> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/effortlessManagement.png'),
                    fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MobileTopNavBarhome(),
                    const SizedBox(
                      height: 10,
                    ),
                    Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Container(
                          width: widthDevice * 0.91,
                          //height: heightDevice * 0.78,
                          decoration: ShapeDecoration(
                            color: Color(0xFF181B1D),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.64,
                                //strokeAlign: BorderSide.,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(9.57),
                            ),
                          ),
                          child: Column(
                            children: [
                              ContactColumnMobile(),
                              ContactUsTextBlock()
                            ],
                          ),
                        ),
                      ),
                      /*Positioned(
                        bottom: 0,
                        right: 0,
                          child: SvgPicture.asset(
                        'images/gear3.svg',
                        height: 100,
                      ))*/
                    ]),
                    const SizedBox(
                      height: 30,
                    )
                  ],
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
