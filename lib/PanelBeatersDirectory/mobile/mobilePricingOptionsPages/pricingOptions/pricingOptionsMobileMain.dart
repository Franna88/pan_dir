import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsItems/PremiumPlusMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsItems/coreMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsItems/premiumMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/pricingOptions/pricingOptionsItems/starterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobilePricingOptionsPages/ui/pricingOptionsContainer.dart';

class PricingOptionsMobileMain extends StatefulWidget {
  PricingOptionsMobileMain({Key? key}) : super(key: key);

  @override
  _PricingOptionsMobileMainState createState() =>
      _PricingOptionsMobileMainState();
}

class _PricingOptionsMobileMainState extends State<PricingOptionsMobileMain> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: heightDevice,
      width: widthDevice,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/pricingback.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MobileTopNavBarhome(),
            const SizedBox(height: 10),
            Text(
              'Pricing Options:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: 'ralewaybold',
                height: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Text(
                'Perfectly tailored for every stage of your growth. Get started today!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFF4F4F4),
                  fontSize: 16,
                  fontFamily: 'raleway',
                  height: 1.2,
                ),
              ),
            ),
            Stack(
              children: [
                PricingOptionsContainer(
                  child: PageView(
                    controller: _pageController,
                    children: [
                      PremiumMobile(),
                      PremiumPlusMobile(),
                      CoreMobile(),
                      StarterMobile(),
                    ],
                  ),
                ),
                Positioned(
                  top: heightDevice * 0.30,
                  left: widthDevice * 0.03,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(0xFF686460),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: heightDevice * 0.30,
                  right: widthDevice * 0.03,
                  child: GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Color(0xFF686460),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
