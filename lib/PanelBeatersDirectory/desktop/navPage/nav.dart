import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/WeCanHelp.dart/WeCanHelp.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFiner.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/newJoinPbdPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/landingPageDisplay.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ListingsByServicesApprovals/ListingsByServicesApprovalsAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ListingsByServicesApprovals/ListingsByServicesApprovalsNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNearMe/ServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesByAddress/servicesByAddressSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesByArea/servicesByArea.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/servicesByKeywordSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/navPage/navBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/weConnectPage/weConnectMainPage/weConnectMainPage.dart';
import 'package:webdirectories/routes/routerNames.dart';

import '../JoinPBDPage/packageInfoPages/packagePagesOptions/packagePage.dart'; // Additional pages
import '../JoinPBDPage/pricingOptions/pricingOptionsPage.dart'; // Additional pages

enum panelNavPages {
  landingpage,
  jobfinder,
  weconnect,
  articles,
  jointpbd,
  ownersportal,
  servicesnearme,
  pricingoptions,
  starterpackage,
  corepackage,
  premiumppackage,
  premiumpluspackage,
  servicesaddress,
  servicesarea,
  serviceskeyword,
  RecentArticlesPage,
  WeCanHelp,
  servicesapprovalsnearme,
  servicesapprovalbyaddress,
}

class Nav extends StatefulWidget {
  panelNavPages? pageIndex;
  final String? searchData;
  final Map<String, dynamic>? approvalsNearMeData;
  final Map<String, dynamic>? approvalsAddressData;
  Nav(
      {super.key,
      this.pageIndex,
      this.searchData,
      this.approvalsNearMeData,
      this.approvalsAddressData});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _currentIndex = 0;
  Map<String, dynamic> address = {'address': '', 'lat': 0.0, 'lng': 0.0};
  List<dynamic> keywordResultData = [];

  void goToWeConnectMainPage() {
    setState(() {
      _currentIndex = 2;
    });
  }

  void goToLandingPageDisplay() {
    setState(() {
      _currentIndex = 0;
    });
  }

  void viewServiceDetails() {
    setState(() {
      _currentIndex = 6;
    });
  }

  void viewServicesByKeyWordDetails() {
    setState(() {
      _currentIndex = 14;
    });
  }

  void viewServicesByAreaDetails() {
    setState(() {
      _currentIndex = 13;
    });
  }

  void viewServicesByAddressDetails(Map<String, dynamic> data) {
    setState(() {
      _currentIndex = 12;
      address = data;
    });
  }

  void navigateToPricingOptions() {
    setState(() {
      _currentIndex = 7;
    });
  }

  void navigateToPackagePage(String packageType) {
    setState(() {
      switch (packageType) {
        case 'Starter':
          _currentIndex = 9; // Adjust indices accordingly
          break;
        case 'Core':
          _currentIndex = 10; // Adjust indices accordingly
          break;
        case 'Premium':
          _currentIndex = 11; // Adjust indices accordingly
          break;
        case 'PremiumPlus':
          _currentIndex = 12; // Adjust indices accordingly
          break;
      }
    });
  }

  @override
  void initState() {
    if (widget.pageIndex != null) {
      switch (widget.pageIndex!) {
        case panelNavPages.landingpage:
          setState(() {
            _currentIndex = 0;
          });
          break;
        case panelNavPages.jobfinder:
          setState(() {
            _currentIndex = 1;
          });
          break;
        case panelNavPages.weconnect:
          setState(() {
            _currentIndex = 2;
          });
          break;
        case panelNavPages.articles:
          setState(() {
            _currentIndex = 3;
          });
          break;
        case panelNavPages.jointpbd:
          setState(() {
            _currentIndex = 4;
          });
          break;
        case panelNavPages.ownersportal:
          setState(() {
            _currentIndex = 5;
          });
          break;
        case panelNavPages.servicesnearme:
          setState(() {
            _currentIndex = 6;
          });
          break;
        case panelNavPages.pricingoptions:
          setState(() {
            _currentIndex = 7;
          });
          break;
        case panelNavPages.starterpackage:
          setState(() {
            _currentIndex = 8;
          });
          break;
        case panelNavPages.corepackage:
          setState(() {
            _currentIndex = 9;
          });
          break;
        case panelNavPages.premiumppackage:
          setState(() {
            _currentIndex = 10;
          });
          break;
        case panelNavPages.premiumpluspackage:
          setState(() {
            _currentIndex = 11;
          });
          break;
        case panelNavPages.servicesaddress:
          setState(() {
            _currentIndex = 12;
          });
          break;
        case panelNavPages.servicesarea:
          setState(() {
            _currentIndex = 13;
          });

        case panelNavPages.serviceskeyword:
          setState(() {
            _currentIndex = 14;
          });
          break;
        case panelNavPages.RecentArticlesPage:
          setState(() {
            _currentIndex = 15;
          });
          break;
        case panelNavPages.WeCanHelp:
          setState(() {
            _currentIndex = 16;
          });
          break;
        case panelNavPages.servicesapprovalsnearme:
          setState(() {
            _currentIndex = 17;
          });
          break;
        case panelNavPages.servicesapprovalbyaddress:
          setState(() {
            _currentIndex = 18;
          });
          break;
        default:
          setState(() {
            _currentIndex = 0;
          });
          break;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      // 0
      LandingPageDisplay(
        goToWeConnectMainPage: goToWeConnectMainPage,
        viewServiceDetails: () {
          viewServiceDetails();
        },
        viewServicesByAddress: viewServicesByAddressDetails,
        viewServicesByArea: () {
          viewServicesByAreaDetails();
        },
        viewServicesByKeyword: () {
          viewServicesByKeyWordDetails();
        },
      ),
      //ServicesFeatured(viewServiceDetails: viewServiceDetails),
      // 1
      JobFinder(),
      // 2
      WeConnectMainPage(goToLandingPageDisplay: goToLandingPageDisplay),
      // LandingPageDisplay(
      //   goToWeConnectMainPage: goToWeConnectMainPage,
      //   viewServiceDetails: () {
      //     viewServiceDetails();
      //   },
      //   viewServicesByAddress: viewServicesByAddressDetails,
      //   viewServicesByArea: () {
      //     viewServicesByAreaDetails();
      //   },
      //   viewServicesByKeyword: () {
      //     viewServicesByKeyWordDetails();
      //   },
      // ),
      // 3
      RecentArticles(),
      // 4
      NewJointPbdPage(navigateToPricingOptions: navigateToPricingOptions),
      // 5
      OwnersPortal(),
      // 6
      ServicesNearMe(),
      // 7
      PricingOptionsPage(
        updateContainerIndex: (int index) {},
        updatePackageType: (String packageType) {
          navigateToPackagePage(packageType);
        },
      ),
      // 8
      PackagePage(packageType: "Starter"), // New Pages
      // 9
      PackagePage(packageType: "Core"), // New Pages
      // 10
      PackagePage(packageType: "Premium"), // New Pages
      // 11
      PackagePage(packageType: "PremiumPlus"), // New Pages
      // 12
      ServicesByAddressSearch(
        addressData: address,
      ),
      // 13
      ServicesByArea(),
      // 14
      ServicesByKeywordSearch(
        searchResults:
            widget.searchData != null ? jsonDecode(widget.searchData!) : [],
      ),
      // 15
      RecentArticlesPage(),
      //16
      WeCanHelp(),
      //17
      ListingsByServicesApprovalsNearMe(
        searchData: widget.approvalsNearMeData != null
            ? widget.approvalsNearMeData!
            : {},
      ),
      // //18
      ListingsByServicesApprovalsAddress(
        searchData: widget.approvalsAddressData != null
            ? widget.approvalsAddressData!
            : {},
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          _pages[_currentIndex],
          Positioned(
            right: 0,
            child: NavBar(
              onIconTapped: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
