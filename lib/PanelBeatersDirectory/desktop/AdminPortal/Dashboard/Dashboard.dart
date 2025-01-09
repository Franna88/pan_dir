import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashPartsandQuote.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashEditProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashJobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashNotificationsUp.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/GraphContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/IconTotalContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/JobFinderOverviewContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/NotificationsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/WelcomeBack.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class Dashboard extends StatefulWidget {
  Function getListingsId;
  String adminListingsId;
  final Function(int) navigateToPage;

  Dashboard(
      {super.key,
      required this.getListingsId,
      required this.navigateToPage,
      required this.adminListingsId});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _firestore = FirebaseFirestore.instance;
  String? _userDisplayImageName; // This will store the image URL
  bool _isLoading = true; // Track loading
  String docId = "";
  String businessLogo = "";
  String userId = "";
  List notifications = [];
  String quotesOutstandingNumber = "0";

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch the user data when the Dashboard initializes
  }

  checkUserDocumentsExpired(listingsId) async {
    QuerySnapshot documentsSnapshot = await _firestore
        .collection('listings_documents')
        .where('listingsId', isEqualTo: listingsId)
        .get();

    if (documentsSnapshot.docs.isNotEmpty) {
      for (var i = 0; i < documentsSnapshot.docs.length; i++) {
//check Date
        var docExpiryDate =
            DateTime.parse(documentsSnapshot.docs[i]['expiryDate']);

//document has expired/ send notification
        if (DateTime.now().difference(docExpiryDate).inDays >= 1) {
          var notificationData = {
            "id": "",
            "listingsId": listingsId,
            "type": "Documents",
            "data": {
              "docName": documentsSnapshot.docs[i]['documentTitle'],
            },
            "title": "Document Expired",
            "from": "System",
            "priority": "low",
            "date": DateTime.now(),
            "read": false
          };

          var doc = await _firestore
              .collection("notificationMessages")
              .add(notificationData);
          await FirebaseFirestore.instance
              .collection("notificationMessages")
              .doc(doc.id)
              .update({"id": doc.id});

          print(notificationData);
        }
      }
    }
  }

  Future<void> _fetchUserData() async {
    // print(user.id);

    try {
      var listingsId = await widget.getListingsId();
      getNotifictions((listingsId));
      //  checkUserDocumentsExpired(listingsId);
      // Fetch the user's document from Firestore based on their ID
      QuerySnapshot userDoc = await _firestore
          .collection('listings')
          .where('listingsId', isEqualTo: listingsId)
          .get();

      if (userDoc.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            userDoc.docs[0].data() as Map<String, dynamic>;

        // Assuming 'displayphoto' is a field that stores the image path
        String? imageUrl = userData['displayphoto'];

        setState(() {
          _userDisplayImageName =
              userData['displayphoto']; // Store image URL in state
          _isLoading = false; // Stop loading once data is fetched
          docId = userDoc.docs[0].id;
          businessLogo = userData['listingLogo'];
          //  print(userData['listingLogo']);
        });
      }
    } catch (e) {
      //   print('Error fetching user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  updateDisplayImage(image) async {
    await _firestore
        .collection('listings')
        .doc(docId) // Use document ID to update
        .update({"displayphoto": image}).whenComplete(() {});
  }

  updateLogo(image) async {
    await _firestore
        .collection('listings')
        .doc(docId) // Use document ID to update
        .update({"listingLogo": image}).whenComplete(() {});
  }

//Get notification based off listingId
  getNotifictions(userId) async {
    final notificationsFuture = _firestore
        .collection('notificationMessages')
        .where('listingsId', isEqualTo: userId)
        .orderBy('date', descending: true)
        .get();

    /* final notificationsQuoteFuture = _firestore
        .collection('notification_quote')
        .where('listingMembersId', isEqualTo: userId)
        .get();*/

    // Run both queries in parallel
    List<QuerySnapshot<Map<String, dynamic>>> results =
        await Future.wait([notificationsFuture]);
    final notificationSnapshot = results[0];
    // final notificationQuoteSnapshot = results[1];

    var unreadCounts = 0;
    for (var notificationItem in notificationSnapshot.docs) {
      if (notificationItem['read'] == false &&
          notificationItem['type'] == "Quote") {
        unreadCounts = unreadCounts + 1;
      }
    }

    setState(() {
      notifications = notificationSnapshot.docs;
      quotesOutstandingNumber = (unreadCounts).toString(); /*   */
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: EdgeInsets.only(
          left: widthDevice < 1500 ? 15 : 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /* DashProfileView(
              onPress: () {
                widget.navigateToPage(14);
              },
              connectToIndexPage: true, // Enables page navigation via dropdown
            ),*/
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*WelcomeBack(),*/
                DashEditProfile(
                    businessLogo: businessLogo,
                    userDisplayImageName:
                        _userDisplayImageName!, // Passing the display image URL here
                    updateDisplayImage: updateDisplayImage,
                    updateLogo: updateLogo),
                /* */
                SizedBox(
                  width: widthDevice < 1500 ? 15 : 30,
                ),
                DashGraph(
                    adminListingsId: widget.adminListingsId,
                    userId: docId,
                    getListingsId: widget.getListingsId) /**/
              ],
            ),
            SizedBox(
              height: widthDevice < 1500 ? 15 : 15,
            ),
            /* SizedBox(
              height: widthDevice < 1500 ? 15 : 30,
            ),*/
            SizedBox(
              height: MyUtility(context).height * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Notificationscontainer(),
                  DashJobFinder(
                    onpress: () {
                      widget.navigateToPage(8);
                    },
                  ),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Dashpartsandquote(
                        containerText: 'Request a\nQuote',
                        containerNumber: '*${quotesOutstandingNumber}',
                        svgImage: 'images/quote.svg',
                      ),
                      Dashpartsandquote(
                        svgImage: 'images/lightStoneLogoSvg.svg',
                        containerText: 'View My Latest\nLightstone Results',
                        containerNumber: '',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Dashpartsandquote(
                            containerText: 'Parts & Equipment\nPlatform',
                            containerNumber: '',
                            svgImage: 'images/gear1.svg',
                            customText: "Comming Soon"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widthDevice < 1500 ? 15 : 30,
                  ),
                  DashNotificationsUp(
                    notificationsList: notifications,
                    onTap: () {
                      widget.navigateToPage(4);
                    },
                  )
                  //JobFinderOverviewContainer()
                  //Notificationscontainer()
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.025,
            )
          ],
        ),
      ),
    );
  }
}
