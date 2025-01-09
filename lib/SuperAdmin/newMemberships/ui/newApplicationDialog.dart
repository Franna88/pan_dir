import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/orangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/button.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/SuperAdmin/newMemberships/models/NewApplicationModel.dart';
import 'package:webdirectories/myutility.dart';

class NewApplicationDialog extends StatefulWidget {
  final NewApplicationModel data;
  final Function closeDialog;
  const NewApplicationDialog(
      {super.key, required this.data, required this.closeDialog});

  @override
  State<NewApplicationDialog> createState() => _NewApplicationDialogState();
}

class _NewApplicationDialogState extends State<NewApplicationDialog> {
  bool isLoading = false;

  Future<void> approveMembership() async {
    try {
      QuerySnapshot listingsSnapshot = await FirebaseFirestore.instance
          .collection('listings')
          .where('listingsId', isEqualTo: widget.data.id)
          .get();

      if (listingsSnapshot.docs.isNotEmpty) {
        await listingsSnapshot.docs.first.reference
            .update({'pendingApproval': 0});
      } else {
        print('No matching document found for listingsId: ${widget.data.id}');
        throw Exception('No matching document found');
      }

      QuerySnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('listing_members')
          .where('authId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      String userName = userSnapshot.docs.first['fullname'];
      await FirebaseFirestore.instance.collection('approved_listings').add({
        'listingsId': widget.data.id,
        'approvalDate': FieldValue.serverTimestamp(),
        'approvedBy': userName
      });

      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DescriptionDialog(
                description: 'Membership Approved Successfully'),
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DescriptionDialog(
                description: 'Membership Approval failed. Please try again'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MyUtility(context).width < 600;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header Section
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                height: 50,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {
                        widget.closeDialog();
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        widget.closeDialog();
                      },
                      child: const Text(
                        'Go Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: isMobile
                    ? MyUtility(context).width
                    : MyUtility(context).width * 0.9,
                height: MyUtility(context).height * 0.78,
                decoration: ShapeDecoration(
                  color: const Color(0xFF181B1D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.57),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Listing Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buildInfoRow('Trading Name', widget.data.tradingName),
                        buildInfoRow('Registered Name',
                            widget.data.registeredBusinessName),
                        buildInfoRow('Bank', widget.data.bank),
                        buildInfoRow('Account Name', widget.data.accountName),
                        buildInfoRow(
                            'Account Number', widget.data.accountNumber),
                        buildInfoRow('Branch Code', widget.data.branchCode),
                        buildInfoRow('Email', widget.data.email),
                        buildInfoRow('Phone', widget.data.phone),
                        buildInfoRow('Address', widget.data.streetAddress),
                        buildInfoRow('City', widget.data.city),
                        buildInfoRow('Province', widget.data.province),
                        buildInfoRow('Postal', widget.data.postal),
                        buildInfoRow('Country', widget.data.country),
                        buildInfoRow(
                            'Membership Type', widget.data.membershipType),
                        buildInfoRow('Date Added',
                            widget.data.dateAdded.toLocal().toString()),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AddButton(
              text: "Approve Membership",
              onPressed: approveMembership,
              waiting: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Rows
Widget buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value.isEmpty ? 'N/A' : value,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
