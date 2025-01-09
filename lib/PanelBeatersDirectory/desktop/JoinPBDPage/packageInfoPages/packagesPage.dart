import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/ContactUsPage/ContactUsMainPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/ballPointText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/exploreOptionsColumn.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/packageBenefitsText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/readMoreButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/packageInfoPages/ui/signUpNowIconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/noIconOrangeButton.dart';

class PackagesPage extends StatefulWidget {
  String optionText;
  String titleText;
  String infoText;
  String infoText2;
  String price;
  List exploreOptions;
  List benefitsTextItems;

  List ballPointItems;

  PackagesPage({
    super.key,
    required this.infoText,
    required this.titleText,
    required this.infoText2,
    required this.price,
    required this.exploreOptions,
    required this.benefitsTextItems,
    required this.optionText,
    required this.ballPointItems,
  });

  @override
  State<PackagesPage> createState() => _PackagesPageState();
}

class _PackagesPageState extends State<PackagesPage> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: heightDevice * 0.40,
                  width: widthDevice / 2.8,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/panlaptop.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: widthDevice / 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.titleText,
                      style: TextStyle(
                        color: Color(0xFFE2822B),
                        fontSize: widthDevice / 20,
                        fontFamily: 'ralewaybold',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      widget.infoText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widthDevice / 75,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      widget.infoText2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: widthDevice / 75,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.price,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice / 35,
                              fontFamily: 'ralewaymedium',
                              height: 1.3),
                        ),
                        Text(
                          'PM',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice / 95,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              height: 3),
                        ),
                      ],
                    ),
                    Text(
                      'billed monthly, excluding VAT',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice / 95,
                          fontFamily: 'raleway',
                          height: 0.3),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SignUpNowIconButton()
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widthDevice * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var i = 0; i < widget.benefitsTextItems.length; i++)
                        PackageBenefitsText(
                          boldText: widget.benefitsTextItems[i]['boldText'],
                          text: widget.benefitsTextItems[i]['text'],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: widthDevice / 25,
                ),
                Container(
                  height: heightDevice * 0.30,
                  width: widthDevice / 7,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/PackegIcon.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: Container(
                width: widthDevice * 0.50,
                decoration: ShapeDecoration(
                  color: Color(0xFFF1F3F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.80),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 3.78,
                      offset: Offset(0, 3.78),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'This ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: widthDevice / 55,
                              fontFamily: 'ralewaybold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: widget.optionText,
                            style: TextStyle(
                              color: Color(0xFFEF9040),
                              fontSize: widthDevice / 55,
                              fontFamily: 'ralewaybold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ' is perfect for',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: widthDevice / 55,
                              fontFamily: 'ralewaybold',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        Column(
                          children: [
                            for (var i = 0;
                                i < widget.ballPointItems.length;
                                i++)
                              BallPointText(
                                ballText: widget.ballPointItems[i],
                              ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NoIconOrangeButton(
                          buttonText: 'Sign Up Now!',
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        ReadMoreButton(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ContactUsMainPage()),
                              );
                            },
                            backgroundColor1: Colors.black,
                            circleColor1: Colors.white,
                            iconColor1: Colors.black,
                            text1: 'Call me back',
                            textColor1: Colors.white)
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Visibility(
                visible: widget.exploreOptions.length >= 1 ? true : false,
                child: ExploreOptionsColumn(
                    exploreOptionsList: widget.exploreOptions))
          ],
        ),
      ),
    );
  }
}
