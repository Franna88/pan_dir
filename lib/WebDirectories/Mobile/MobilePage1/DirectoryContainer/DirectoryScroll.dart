import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/DirectoryContainer/DirectoryContainer.dart';
import 'package:webdirectories/myutility.dart';

class DirectoryScroll extends StatefulWidget {
  const DirectoryScroll({Key? key}) : super(key: key);

  @override
  State<DirectoryScroll> createState() => _DirectoryScrollState();
}

class _DirectoryScrollState extends State<DirectoryScroll> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height * 0.6,
          child: PageView(
            controller: _pageController,
            children: [
              /* DirectoryContainer(
                page: '1/5',
                headlinebold: 'Download ',
                headline: 'WATIF',
                discription:
                    "Register and Download the FREE powerful App for all up-to-date info on Fuel-, Tow-, Repair-, and Services. At your fingertips, Saving Time and Money as you travel, nationwide.",
                onpress: () {},
                pageController: _pageController,
              ),
              DirectoryContainer(
                page: '2/5',
                headlinebold: 'TOWING ',
                headline: 'Directory',
                discription:
                    "Professional help and roadside assistance in an emergency. Or find any specialist services nationwide. Read Reviews",
                onpress: () {},
                pageController: _pageController,
              ),
              DirectoryContainer(
                page: '3/5',
                headlinebold: 'PANEL BEATER ',
                headline: 'Directory',
                discription:
                    "Find professional help nearby, or nationwide, for any type of repair, your vehicle brand, acceptable to your insurance. Read Reviews.",
                onpress: () {},
                pageController: _pageController,
              ),
              DirectoryContainer(
                page: '4/5',
                headlinebold: 'AUTO REPAIR ',
                headline: 'Directory',
                discription:
                    "Locate qualified services nearby or nationwide, for service, spares, or specialist repairs. Read Reviews.",
                onpress: () {},
                pageController: _pageController,
              ),
              DirectoryContainer(
                page: '5/5',
                headlinebold: 'FUEL ',
                headline: 'Directory',
                discription:
                    "Locate & navigate to the Nearest-, Cheapest- or a specific Fuel brand. Get Fuel Prices and Rewards, Coffee, Food, Toilets, Shops, ATMs, and all other services nationwide. ",
                onpress: () {},
                pageController: _pageController,
              ),*/
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.051,
        )
      ],
    );
  }
}
