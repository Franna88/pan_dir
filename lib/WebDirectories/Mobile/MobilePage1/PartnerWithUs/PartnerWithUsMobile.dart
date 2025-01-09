import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/PartnerWithUs/PartnerMobileComponents/ParnerMobileContainer.dart';
import 'package:webdirectories/myutility.dart';

class PartnerWithUsMobile extends StatefulWidget {
  const PartnerWithUsMobile({Key? key}) : super(key: key);

  @override
  State<PartnerWithUsMobile> createState() => _PartnerWithUsMobileState();
}

class _PartnerWithUsMobileState extends State<PartnerWithUsMobile> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

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
          width: MyUtility(context).width / 1.2,
          child: Text(
            'Why partner\nwith us?',
            style: TextStyle(fontSize: 42, fontFamily: 'ralewaysemi'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.15,
          height: 450,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: const [
              PartnerMobileContainer(
                image: 'images/target.svg',
                header: 'Targeted Lead Generation',
                description:
                    "We offer niche-specific directories with first-page Google rankings and targeted advertising, ensuring you reach potential customers actively seeking your services and driving more qualified leads to your business.",
              ),
              PartnerMobileContainer(
                image: 'images/gear.svg',
                header: 'Actionable Insights',
                description:
                    "Leverage our data-driven insights to optimize your listing, track key metrics (clicks, leads, conversions), and refine your marketing strategy for continuous growth, brand awareness, and maximized ROI.",
              ),
              PartnerMobileContainer(
                image: 'images/review.svg',
                header: 'Trustworthy Reviews',
                description:
                    "Stand out from the competition with trusted reviews and industry ratings that build confidence in potential customers. Real-time feedback from these reviews also helps you improve your services and build lasting relationships, giving you a clear competitive edge.",
              ),
              PartnerMobileContainer(
                image: 'images/partner.svg',
                header: 'Established Partner',
                description:
                    "With a proven decade-long track record and a commitment to customer satisfaction, we foster trustworthy relationships with businesses and industry leaders, offering stability, valuable connections, and unwavering support for your success.",
              ),
              PartnerMobileContainer(
                image: 'images/keyss.svg',
                header: 'Owners Portal',
                description:
                    "Our scalable platform empowers you to manage your business profile anytime, anywhere through our 24/7 accessible cloud platform, ensuring consistent and accurate information across over 11,200 profiles in 8 countries, helping you connect with a wider audience.",
              ),
              PartnerMobileContainer(
                image: 'images/search.svg',
                header: 'SEO Expertise',
                description:
                    "Leverage our first-page Google rankings and comprehensive marketing solutions that combine SEO, SEM, and targeted advertising to drive organic traffic, increase brand visibility, and attract qualified leads who convert into paying customers.",
              ),
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_currentPageIndex > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ),
            ),
            Text(
              '${_currentPageIndex + 1}/6',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_currentPageIndex < 5) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
      ],
    );
  }
}
