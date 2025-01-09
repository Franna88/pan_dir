import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

import '../../../../utils/loginUtils.dart';
import '../LeaveReviewMobile/LeaveReviewMobile.dart';
import 'LeftReviewsMobile/LeftReviewsMobile.dart';
import 'RatingReviewsMobile/RatingReviewsMobile.dart';

class ReviewsMainContainerMobile extends StatefulWidget {
  const ReviewsMainContainerMobile({super.key});

  @override
  State<ReviewsMainContainerMobile> createState() =>
      _ReviewsMainContainerMobileState();
}

class _ReviewsMainContainerMobileState
    extends State<ReviewsMainContainerMobile> {
  var pageIndex = 0;

  //this function changes page index
  changePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  String id = '';
  List<Map<String, dynamic>> _reviews = [];
  Map<String, dynamic> _lightStoneData = {};
  bool _isloading = true;
  final _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    getReviewList();
    super.initState();
  }

  void onReviewSubmit(Map<String, dynamic> newReview) {
    getReviewList();
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

  @override
  Widget build(BuildContext context) {
    List reviewPages = [
      RatingReviewsMobile(
        changePageIndex: changePageIndex,
        reviewsData: _reviews,
        waiting: _isloading,
      ),
      LeaveReviewMobile(
        changePageIndex: changePageIndex,
        onReviewSubmit: onReviewSubmit,
      ),
    ];
    return SingleChildScrollView(
      child: Container(
        width: MyUtility(context).width * 0.9,
        decoration: ShapeDecoration(
          color: Color(0xFF181B1D),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: reviewPages[pageIndex],
              ),
            ),
            /*RatingReviewsMobile(),
            LeaveReviewMobile(),*/
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            LeftReviewsMobile(),
          ],
        ),
      ),
    );
  }
}
