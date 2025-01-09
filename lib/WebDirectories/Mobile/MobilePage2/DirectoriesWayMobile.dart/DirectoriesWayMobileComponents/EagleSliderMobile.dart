import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/EagleContainerMobile.dart';
import 'package:webdirectories/myutility.dart';

class EagleSliderMobile extends StatefulWidget {
  const EagleSliderMobile({Key? key}) : super(key: key);

  @override
  State<EagleSliderMobile> createState() => _EagleSliderMobileState();
}

class _EagleSliderMobileState extends State<EagleSliderMobile> {
  int _currentPageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPageIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.025,
        ),
        SizedBox(
          height: 325,
          width: MyUtility(context).width / 1.15,
          child: PageView.builder(
            itemCount: 5,
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: EagleContainerMobile(
                    image: 'images/eagle${index + 1}.png',
                    headlinetext: _getHeadlineText(index),
                    text: _getText(index),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
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
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
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

  String _getHeadlineText(int index) {
    switch (index) {
      case 0:
        return "Our Actions: Rak Chazak Amatz";
      case 1:
        return " Without Vision People Perish";
      case 2:
        return "We will never forget who gives us Eagle Wings";
      case 3:
        return "Our Plan: We can do Anything through Christ";
      case 4:
        return "Our Creed: Raptare! Seize the Moment";
      default:
        return "";
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return "Joshua 1:7";
      case 1:
        return "Proverbs 29:18";
      case 2:
        return "Isaiah 40:31";
      case 3:
        return "Philippians 4:13";
      case 4:
        return "Luke 9:62";
      default:
        return "";
    }
  }
}
