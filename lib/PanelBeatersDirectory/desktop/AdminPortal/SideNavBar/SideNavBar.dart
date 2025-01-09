import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminJobFinder/AdminJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminLightStoneKai/AdminLightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/AdminProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/Dashboard.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageUsers/ManageUsers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/AdminNotificationsAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/SideNavBar/SideNavButton/SideNavButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/WebDirectories/Page1/Page1.dart';
import 'package:webdirectories/myutility.dart';

import '../../../models/storedUser.dart';
import '../../../panelBeatersHome.dart';
import '../../../utils/loginUtils.dart';
import '../AdminJobFinder/JobFinderDetails.dart';
import '../Advertisement/AdvertisementAlt.dart';
import '../ContactUsPage/OwnersContactUs.dart';
import '../Dashboard/DashboardContainers/DashProfileView.dart';
import '../Dashboard/DashboardContainers/ManageProfile.dart';
import '../IndustryNews/IndustryNews.dart';
import '../ManageMyAccount/ManageAccount.dart';
import '../Notifications/CustomerReviews.dart/CustomerReviews.dart';
import '../Notifications/DocumentExpires/DocumentExpired.dart';
import '../Notifications/NotificationMessage.dart/NotificationMessage.dart';
import '../Notifications/NotificationWelcome/NotificationWelcome.dart';
import '../Notifications/SystemAlert.dart/SystemAlert.dart';
import '../PerformanceandStats/PerformanceandStats.dart';

class SideNavBar extends StatefulWidget {
  bool normalUser;
  String adminListingsId;
  SideNavBar(
      {Key? key, required this.normalUser, required this.adminListingsId})
      : super(key: key);

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  final PageController _pageController = PageController(initialPage: 0);
  final _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 0;
  int listingsId = 0;
  Map<String, dynamic> lightstoneData = {};
  String membershipType = "";
  NotificationsModel notificationData = NotificationsModel(
      notificationTypeId: '',
      listingsId: 0,
      notification: '',
      notificationTitle: '');

  var jobDetails = JobFinderModel(
    name: '',
    email: '',
    qualification: '',
    city: '',
    province: '',
    country: '',
    occupation: '',
    years: '',
    contactNumber: '',
    dateSubmitted: Timestamp.fromDate(DateTime.now()),
  );

  getJobDetails(value) {
    setState(() {
      jobDetails = JobFinderModel(
        name: value.name,
        email: value.email,
        qualification: value.qualification,
        city: value.city,
        province: value.province,
        country: value.country,
        occupation: value.occupation,
        years: value.years,
        contactNumber: value.contactNumber,
        dateSubmitted: value.dateSubmitted,
      );
    });
  }

  //check if id is old or new id
  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) is double;
  }

  getListingId() async {
    if (widget.adminListingsId != "") {
      print("Next");
      //Admin View
      //get old/ new Id
      var docId = _isNumeric(widget.adminListingsId!)
          ? int.parse(widget.adminListingsId!)
          : widget.adminListingsId!;
      print(docId);
      print(docId);
      return docId;
    } else {
      StoredUser? user = await getUserInfo();
      if (user != null) {
        var docId = _isNumeric(user.id) ? int.parse(user.id) : user.id;
        print(docId);
        print(docId);
        return docId;
      }
    }
  }

  getLightStoneData() async {
    var id = await getListingId();
    // Fetch registration data in parallel
    final futures = await Future.wait([
      _firestore
          .collection('registration_numbers')
          .where('listingsId', isEqualTo: id)
          .get(),
    ]);

    final registrationDataSnapshot = futures[0] as QuerySnapshot;
    List<Map<String, dynamic>> registrationData = registrationDataSnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();

    List<Map<String, dynamic>> filteredRegistrationData =
        registrationData.where((e) => e['registrationTypeId'] == 8).toList();

    print("REGISTERLight");
    if (filteredRegistrationData.isEmpty) {
      print('No lightstone found');
    }
    print(filteredRegistrationData[0]['registrationNumbers']);
    if (registrationDataSnapshot.docs.isNotEmpty) {
      QuerySnapshot lightstoneSnapshot = await _firestore
          .collection('lightstone')
          .where('brid',
              isEqualTo: (filteredRegistrationData[0]['registrationNumbers'])
                  .toString())
          .limit(1)
          .get();
      print(lightstoneSnapshot.docs[0]['brid']);
      if (lightstoneSnapshot.docs.isNotEmpty) {
        setState(() {
          lightstoneData =
              lightstoneSnapshot.docs.first.data() as Map<String, dynamic>;
        });
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  void navigateToPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  getQuoteDetails(quoteData) {
    setState(() {
      notificationData = quoteData;
    });
  }

  viewProfile() {
    //Open owners portal
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.transparent,
          child: Services(
            listingId: widget.adminListingsId,
          ),
        );
      },
    );
  }

  void _handleLogout() {
    // Implement your logout logic here
    print('Executing logout...');
    FirebaseAuth.instance.signOut();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PanelBeatersHome()),
    );
  }

  @override
  void initState() {
    getLightStoneData();
    getUserDetails();
    super.initState();
  }

  void getUserDetails() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      print('membership type: ${user.membershipType}');
      setState(() {
        membershipType = user.membershipType;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var pages = [
      Dashboard(
        navigateToPage: navigateToPage,
        adminListingsId: widget.adminListingsId,
        getListingsId: getListingId,
      ),
      AdminProfile(
        getListingId: getListingId,
      ),
      //Advertisement(),
      AdvertisementAlt(),
      ManageUsers(normalUser: widget.normalUser),
      AdminNotificationsAlt(
          navigateToPage: navigateToPage,
          getQuoteDetails: getQuoteDetails), //Quotes
      SystemAlert(
        navigateToPage: navigateToPage,
      ),
      DocumentExpired(
        navigateToPage: navigateToPage,
      ),
      CustomerReviews(
        getQuoteDetails: getQuoteDetails,
        navigateToPage: navigateToPage,
      ),
      AdminJobFinder(
        navigateToPage: navigateToPage,
        getJobDetails: getJobDetails,
      ),
      //JobFinderDetails(),
      AdminLightStone(data: lightstoneData, listingsId: listingsId),
      PerformanceAndStats(
        getListingsId: getListingId,
      ),
      OwnersContactUs(
        getListingId: getListingId,
      ),
      IndustryNews(),
      ManageAccount(),

      ManageProfile(navigateToPage: navigateToPage),
      NotificationWelcome(
        navigateToPage: navigateToPage,
      ),
      NotificationMessage(
          navigateToPage: navigateToPage, notificationData: notificationData),

      JobFinderDetails(
        job: jobDetails,
        navigateToPage: navigateToPage,
      ),
    ];

    return Row(
      children: [
        Container(
          width: MyUtility(context).width / 5.2,
          height: MyUtility(context).height,
          decoration: BoxDecoration(
            color: Color(0xFF181B1D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/newpandir.png',
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    SideNavButton(
                      icon: 'images/dash1.svg',
                      selectedIcon: 'images/dash1.1.svg',
                      label: 'Dashboard',
                      isSelected: _selectedIndex == 0,
                      onTap: () => _onItemTapped(0),
                    ),
                    SideNavButton(
                      icon: 'images/dash2.svg',
                      selectedIcon: 'images/dash2.1.svg',
                      label: 'Edit My Profile',
                      isSelected: _selectedIndex == 1,
                      onTap: () => _onItemTapped(1),
                    ),
                    SideNavButton(
                      icon: 'images/dash3.svg',
                      selectedIcon: 'images/dash3.1.svg',
                      label: 'Edit Specials & Promotions',
                      isSelected: _selectedIndex == 2,
                      onTap: () {
                        if (membershipType != 'PremiumA' &&
                            membershipType != 'PremiumM' &&
                            membershipType != 'Premium+A' &&
                            membershipType != 'Premium+M') {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: DescriptionDialog(
                                  description:
                                      'You need to be a premium member to access this feature.'),
                            ),
                          );
                          return;
                        }

                        _onItemTapped(2);
                      },
                    ),
                    SideNavButton(
                      icon: 'images/dash4.svg',
                      selectedIcon: 'images/dash4.1.svg',
                      label: 'Notifications',
                      isSelected: _selectedIndex == 4,
                      onTap: () => _onItemTapped(4),
                    ),
                    SideNavButton(
                      icon: 'images/dash5.svg',
                      selectedIcon: 'images/dash5.1.svg',
                      label: 'Lightstone KAI',
                      isSelected: _selectedIndex == 9,
                      onTap: () => _onItemTapped(9),
                    ),
                    SideNavButton(
                      icon: 'images/dash6.svg',
                      selectedIcon: 'images/dash6.1.svg',
                      label: 'Job Finder',
                      isSelected: _selectedIndex == 8,
                      onTap: () => _onItemTapped(8),
                    ),
                    SideNavButton(
                      icon: 'images/dash7.svg',
                      selectedIcon: 'images/dash7.1.svg',
                      label: 'Industry News',
                      isSelected: _selectedIndex == 12,
                      onTap: () => _onItemTapped(12),
                    ),
                    SideNavButton(
                      icon: 'images/dash8.svg',
                      selectedIcon: 'images/dash8.1.svg',
                      label: 'Profile Performance & Stats',
                      isSelected: _selectedIndex == 10,
                      onTap: () => _onItemTapped(10),
                    ),
                    SideNavButton(
                      icon: 'images/dash9.svg',
                      selectedIcon: 'images/dash9.1.svg',
                      label: 'Manage My Account',
                      isSelected: _selectedIndex == 13,
                      onTap: () => _onItemTapped(13),
                    ),
                    SideNavButton(
                      icon: 'images/dash10.svg',
                      selectedIcon: 'images/dash10.1.svg',
                      label: 'Manage Users',
                      isSelected: _selectedIndex == 3,
                      onTap: () => _onItemTapped(3),
                    ),
                    SideNavButton(
                      icon: 'images/dash11.svg',
                      selectedIcon: 'images/dash11.1.svg',
                      label: 'Contact Us',
                      isSelected: _selectedIndex == 11,
                      onTap: () => _onItemTapped(11),
                    ),
                    SizedBox(
                        height: widthDevice < 1500
                            ? MyUtility(context).height * 0.23
                            : MyUtility(context).height * 0.38),
                    SideNavButton(
                      icon: 'images/Logout.svg',
                      selectedIcon: 'images/Logout.svg',
                      label: 'Logout',
                      isSelected: _selectedIndex == 6,
                      onTap: () {
                        _handleLogout();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width - MyUtility(context).width / 5.2,
          height: MyUtility(context).height,
          decoration: BoxDecoration(color: Color(0xFF171616)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: DashProfileView(
                  onViewProfile: viewProfile,
                  onSelect: (index) =>
                      navigateToPage(index), // Ensure this is correct
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: pages,
                ),
              ), /**/
            ],
          ),
        ),
      ],
    );
  }
}
