import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStone.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/ReviewsMainContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsComponents/ReviewsNavButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsOrangeContainer extends StatefulWidget {
  const ReviewsOrangeContainer({super.key});

  @override
  State<ReviewsOrangeContainer> createState() => _ReviewsOrangeContainerState();
}

class _ReviewsOrangeContainerState extends State<ReviewsOrangeContainer> {
  String id = '';
  List<Map<String, dynamic>> _reviews = [];
  Map<String, dynamic> _lightStoneData = {};
  bool _isloading = true;
  final _firestore = FirebaseFirestore.instance;
  var pageIndex = 0;
  var listingEmail = "";

  @override
  void initState() {
    //_getReviewData();
    getReviewList();
    super.initState();
  }

  getReviewList() async {
    List<Map<String, dynamic>> reviewData = [];
    Map<String, dynamic> lightstoneData = {};
    String? listingId = await GetListingId();

    if (listingId != null) {
      int listingIdInt = int.parse(listingId);

      final futures = await Future.wait([
        _firestore
            .collection('notificationMessages')
            .where('listingsId', isEqualTo: listingIdInt)
            .where('type', isEqualTo: "Rating")
            .get(),
        _firestore
            .collection('registration_numbers')
            .where('listingsId', isEqualTo: listingIdInt)
            .get(),
      ]);

      final reviewsSnapshot = futures[0] as QuerySnapshot;

      if (reviewsSnapshot.docs.isNotEmpty) {
        reviewData = reviewsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      }

      final registrationDataSnapshot = futures[1] as QuerySnapshot;
      if (registrationDataSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> registrationData = registrationDataSnapshot
            .docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<Map<String, dynamic>> filteredRegistrationData = registrationData
            .where((e) => e['registrationTypeId'] == 8)
            .toList();

        if (filteredRegistrationData.isNotEmpty) {
          QuerySnapshot lightstoneSnapshot = await _firestore
              .collection('lightstone')
              .where('brid',
                  isEqualTo:
                      filteredRegistrationData.first['registrationNumbers'])
              .limit(1)
              .get();

          if (lightstoneSnapshot.docs.isNotEmpty) {
            lightstoneData =
                lightstoneSnapshot.docs.first.data() as Map<String, dynamic>;
          }
        }
      }

      setState(() {
        id = listingId;
        _reviews = reviewData;
        _lightStoneData = lightstoneData;
        _isloading = false;
      });
      /*    final notificationDocs = _firestore
          .collection('notificationMessages')
          .where('listingsId', isEqualTo: listingIdInt)
          .where("type", isEqualTo: "Quote")
          //.orderBy('date', descending: true)
          .get();
          if(notificationDocs.)
          {

          }*/
    }
  }

  Future<void> _getReviewData() async {
    List<Map<String, dynamic>> reviewData = [];
    Map<String, dynamic> lightstoneData = {};
    String? listingId = await GetListingId();

    if (listingId != null) {
      int listingIdInt = int.parse(listingId);

      // Fetch reviews and registration data in parallel
      final futures = await Future.wait([
        _firestore
            .collection('rating')
            .where('listingsId', isEqualTo: listingIdInt)
            .get(),
        _firestore
            .collection('registration_numbers')
            .where('listingsId', isEqualTo: listingIdInt)
            .get(),
        _firestore
            .collection('listings')
            .where('listingsId', isEqualTo: listingIdInt)
            .limit(1)
            .get(),
      ]);

      final reviewsSnapshot = futures[0] as QuerySnapshot;
      final registrationDataSnapshot = futures[1] as QuerySnapshot;
      final listingSnapshot = futures[2] as QuerySnapshot;

      if (reviewsSnapshot.docs.isNotEmpty) {
        reviewData = reviewsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      }

      if (registrationDataSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> registrationData = registrationDataSnapshot
            .docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<Map<String, dynamic>> filteredRegistrationData = registrationData
            .where((e) => e['registrationTypeId'] == 8)
            .toList();

        if (filteredRegistrationData.isNotEmpty) {
          QuerySnapshot lightstoneSnapshot = await _firestore
              .collection('lightstone')
              .where('brid',
                  isEqualTo:
                      filteredRegistrationData.first['registrationNumbers'])
              .limit(1)
              .get();

          if (lightstoneSnapshot.docs.isNotEmpty) {
            lightstoneData =
                lightstoneSnapshot.docs.first.data() as Map<String, dynamic>;
          }
        }
      }

      if (listingSnapshot.docs.isNotEmpty) {
        listingEmail = listingSnapshot.docs[0]['businessEmail'];
      }
      setState(() {
        id = listingId;
        _reviews = reviewData;
        _lightStoneData = lightstoneData;
        _isloading = false;
      });
    } else {
      setState(() {
        _isloading = false;
      });
    }
  }

  // This function changes page index
  void changePageIndex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void _onReviewsUpdated(Map<String, dynamic> newReview) {
    getReviewList();
/*    List<Map<String, dynamic>> reviewsData = _reviews;
    reviewsData.add(newReview);

    setState(() {
      _reviews = reviewsData;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> reviewPages = [
      ReviewsMainContainer(
        reviewsData: _reviews,
        waiting: false,
        onLeaveReview: _onReviewsUpdated,
        listingEmail: listingEmail,
      ),
      LightStone(data: _lightStoneData),
    ];
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewsNAvButton(
              hasLightStone: _lightStoneData.isNotEmpty,
              changePageIndex: changePageIndex,
              pageIndex: pageIndex,
            ),
            Container(
              width: MyUtility(context).width * 0.845,
              height: MyUtility(context).height * 0.71,
              decoration: ShapeDecoration(
                color: pageIndex == 0 ? Color(0xFFFF8828) : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Center(
                child: reviewPages[pageIndex],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
