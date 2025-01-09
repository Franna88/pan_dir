import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/SuperAdmin/newMemberships/ui/newApplicationDialog.dart';
import 'package:webdirectories/SuperAdmin/newPlanSubmissions/models/NewPlanSubmissionsModel.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';

class NewPlanSubmissionPopup extends StatelessWidget {
  final NewPlanSubmissionsModel data;
  final Function closeDialog;
  const NewPlanSubmissionPopup(
      {super.key, required this.data, required this.closeDialog});

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
                        closeDialog();
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
                        closeDialog();
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
                          'Submission Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        buildInfoRow(
                            'Date Added',
                            DateFormat('dd/MM/yyyy')
                                .format((data.dateAdded).toDate())),
                        buildInfoRow('Name', data.name),
                        buildInfoRow('Email Address', data.email),
                        buildInfoRow('Phone Number', data.phoneNumber),
                        for (int i = 0; i < data.answers.length; i++) ...[
                          buildInfoRow(data.answers[i]['question'],
                              data.answers[i]['answer']),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
