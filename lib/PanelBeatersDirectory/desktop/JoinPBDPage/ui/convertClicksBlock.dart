import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/orangeButton.dart';

class ConvertClicksBlock extends StatefulWidget {
  final VoidCallback navigateToPricingOptions;

  const ConvertClicksBlock({super.key, required this.navigateToPricingOptions});

  @override
  State<ConvertClicksBlock> createState() => _ConvertClicksBlockState();
}

class _ConvertClicksBlockState extends State<ConvertClicksBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: widthDevice * 0.85,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: widthDevice * 0.40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Convert Clicks\nto Customers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 50 : 70,
                      fontFamily: 'ralewaymedium',
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Dominate local searches with first-page Google Rankings, build trust with real customer reviews, and target ideal clients with our advertising opportunities. Showcase your expertise with a customizable profile you manage via our state of the art Owners Portal – all designed to maximize your ROI through clicks, leads, and proven conversion stats. Partner with us and watch your business thrive!',
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: heightDevice < 710
                          ? 16
                          : widthDevice < 1500
                              ? 20.4
                              : 22,
                      fontFamily: 'raleway',

                      height: 1.2,
                      //letterSpacing: 0.90,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  OrangeButton(
                    buttonText: 'What does it cost?',
                    onPressed: widget.navigateToPricingOptions,
                  ),
                ],
              ),
            ),
            Container(
              width: heightDevice < 710 ? widthDevice / 6 : widthDevice / 8.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '2k+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE5882F),
                      fontSize: widthDevice < 1500 ? 50 : 70,
                      fontFamily: 'ralewaybold',
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Network of shops that benefit from our decade-long customer support and industry partnerships.',
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: heightDevice < 710
                          ? 16
                          : widthDevice < 1500
                              ? 20.4
                              : 22,
                      fontFamily: 'raleway',

                      height: 1.2,
                      //letterSpacing: 0.90,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: heightDevice < 710 ? widthDevice / 6 : widthDevice / 8.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '44m+',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFE5882F),
                      fontSize: widthDevice < 1500 ? 50 : 70,
                      fontFamily: 'ralewaybold',
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Total page lead views to date.',
                    style: TextStyle(
                      color: Color(0xFFF4F4F4),
                      fontSize: heightDevice < 710
                          ? 16
                          : widthDevice < 1500
                              ? 20.4
                              : 22,
                      fontFamily: 'raleway',

                      height: 1.2,
                      //letterSpacing: 0.90,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
