import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/AdminSelectServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/SelectaCategory.dart';

class Approvals extends StatefulWidget {
  Function getListingId;
  Approvals({super.key, required this.getListingId});

  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  List services = [];
  List listingApprovalsList = [];
  final _firestore = FirebaseFirestore.instance;

  fetchServiceListBasedOnCategory(approvalsId) async {
    QuerySnapshot approvalsData = await _firestore
        .collection('approvals')
        .where("approvalsCategoryId", isEqualTo: approvalsId)
        .get();
    if (approvalsData.docs.isNotEmpty) {
      setState(() {
        services = approvalsData.docs;
      });
    }
  }

  //get approvals for checkBoxes
  fetchApprovalsForListing(approvalsId) async {
    print("GOT DATA");
    print(approvalsId);
    var listingsId = await widget.getListingId();

    QuerySnapshot listingApprovals = await _firestore
        .collection('listing_approvals')
        .where("listingsId", isEqualTo: listingsId)
        // .where("approvalsId", isEqualTo: approvalsId)
        .get();

    if (listingApprovals.docs.isNotEmpty) {
      print("GOT DATA");
      setState(() {
        listingApprovalsList = listingApprovals.docs;
      });
    }
  }

  addItemToApproveList(data) async {
    await _firestore.collection('listing_approvals').add(data);
    await fetchApprovalsForListing(data['approvalsId']);
  }

  removeItemFromApprovalsList(approvalsId) async {
    var listingsId = await widget.getListingId();
    QuerySnapshot listingApprovals = await _firestore
        .collection('listing_approvals')
        .where("listingsId", isEqualTo: listingsId)
        .where("approvalsId", isEqualTo: approvalsId)
        .limit(1)
        .get();

    if (listingApprovals.docs.isNotEmpty) {
      await _firestore
          .collection('listing_approvals')
          .doc(listingApprovals.docs[0].id)
          .delete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30, bottom: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SelectaCategory(
                fetchServiceListBasedOnCategory:
                    fetchServiceListBasedOnCategory,
                fetchApprovalsForListing: fetchApprovalsForListing),
            Adminselectservices(
                services: services,
                listingApprovalsList: listingApprovalsList,
                getListingId: widget.getListingId,
                addItemToApproveList: addItemToApproveList,
                removeItemFromApprovalsList: removeItemFromApprovalsList)
          ],
        ),
      ),
    );
  }
}
