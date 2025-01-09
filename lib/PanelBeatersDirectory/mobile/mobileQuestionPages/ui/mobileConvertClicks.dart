import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsMobileMain.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/questionOrangeButton.dart';

class MobileConvertClicks extends StatefulWidget {
  const MobileConvertClicks({super.key});

  @override
  State<MobileConvertClicks> createState() => _MobileConvertClicksState();
}

class _MobileConvertClicksState extends State<MobileConvertClicks> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Convert Clicks to ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontFamily: 'ralewaymedium',
                    height: 1,
                  ),
                ),
                TextSpan(
                  text: 'Customers',
                  style: TextStyle(
                    color: Color(0xFFE5882F),
                    fontSize: 45,
                    fontFamily: 'ralewaymedium',
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Dominate local searches with first-page Google Rankings, build trust with real customer reviews, and target ideal clients with our advertising opportunities. Showcase your expertise with a customizable profile you manage via our state of the art Owners Portal – all designed to maximize your ROI through clicks, leads, and proven conversion stats. Partner with us and watch your business thrive!',
            style: TextStyle(
              color: Color(0xFFF4F4F4),
              fontSize: 16,
              fontFamily: 'raleway',

              height: 1.2,
              //letterSpacing: 0.90,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          QuestionOrangeButton(
              buttonText: 'What does it cost?',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Material(child: PricingOptionsMobileMain())));
              }),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: widthDevice * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '2k+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE5882F),
                        fontSize: 35,
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
                        fontSize: widthDevice < 380 ? 14 : 16,
                        fontFamily: 'raleway',

                        height: 1.2,
                        //letterSpacing: 0.90,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: widthDevice * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '44m+',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE5882F),
                        fontSize: 35,
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
                        fontSize: widthDevice < 380 ? 14 : 16,
                        fontFamily: 'raleway',

                        height: 1.2,
                        //letterSpacing: 0.90,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
