import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/ArticlesContainermobile.dart';
import 'package:webdirectories/myutility.dart';

import '../mobileDummyArticle.dart';

class ArticlesSliderMobile extends StatefulWidget {
  const ArticlesSliderMobile({Key? key}) : super(key: key);

  @override
  State<ArticlesSliderMobile> createState() => _ArticlesSliderMobileState();
}

class _ArticlesSliderMobileState extends State<ArticlesSliderMobile> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.05,
          height: 460,
          child: PageView(
            controller: _pageController,
            children: [
              ArticlesContainerMobile(
                image: 'images/drive.png',
                catagory: 'Panel Beater Directory',
                headline:
                    "See your Lightstone EchoMBR Results for February 2024",
                writer: 'Wena Cronje',
                discription:
                    "Your CSI success contributes to your business success and assists both prospects and industry users.",
                onpress: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MobileDummyArticle()),
              );
                },
              ),
              ArticlesContainerMobile(
                  image: 'images/turbine.png',
                  catagory: 'Fuel Directory',
                  headline:
                      "What Would Happen If You Put Jet Fuel in Your Car?",
                  writer: 'Wena Cronje',
                  discription:
                      "Will jet fuel provide a performance boost or lead to disastrous results?",
                  onpress: () {}),
              ArticlesContainerMobile(
                  image: 'images/drive1.png',
                  catagory: 'Towing Directory',
                  headline: "Why Compare Car Insurance quotes?",
                  writer: 'Wena Cronje',
                  discription:
                      "Let us explore how you could save big on your premiums.",
                  onpress: () {}),
              ArticlesContainerMobile(
                  image: 'images/buisness.png',
                  catagory: 'Web Directories',
                  headline: "How to Create a Killer Web Directories Listing",
                  writer: 'Wena Cronje',
                  discription:
                      "Today, we'll share 7 tips to drive your online presence and revenue to new heights.",
                  onpress: () {}),
              ArticlesContainerMobile(
                  image: 'images/confrance.png',
                  catagory: 'Web Directories',
                  headline: "Is Hybrid Work spaces the Future?",
                  writer: 'Wena Cronje',
                  discription:
                      "Let’s explore hybrid working models that combines home and office work.",
                  onpress: () {}),
              ArticlesContainerMobile(
                  image: 'images/crime.png',
                  catagory: 'Auto Repair Directory',
                  headline:
                      "Hijacking and Carjacking: What to do in such events",
                  writer: 'Wena Cronje',
                  discription:
                      "Hijacking in South Africa is one of those scary facts we do not like to think about. Prevention is better than cure.",
                  onpress: () {}),
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.015,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 1.5),
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              ),
            )
          ],
        ),
      ],
    );
  }
}
