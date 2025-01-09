import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationMessage.dart/NotMessageReuseable/BackButtonMessage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/jobFinder/sendJobFinderDataOP.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/jobFinder.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import 'JobFinderComp/ReqruitDetails.dart';

class JobFinderDetails extends StatelessWidget {
  final Function(int) navigateToPage;
  final JobFinderModel job;

  const JobFinderDetails(
      {Key? key, required this.job, required this.navigateToPage})
      : super(key: key);

  Future<void> sendEmailData(BuildContext context) async {
    StoredUser? userData = await getUserInfo();

    if (userData == null) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: DescriptionDialog(
                description: "Cannot get user data to send email"),
          );
        },
      );
      return;
    }

    await sendJobFinderDataOP(
        userName: userData.fullName,
        userEmail: userData.email,
        jobFinderName: job.name,
        datePublished:
            '${job.dateSubmitted.toDate().year}-${job.dateSubmitted.toDate().month}-${job.dateSubmitted.toDate().day}',
        occupation: job.occupation,
        yearsExperience: job.years,
        areaOfWork: '${job.province} ${job.city} ${job.country}',
        contactNumber: job.contactNumber,
        jobFinderEmail: job.email);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: DescriptionDialog(
              description: "Email has been successfully to ${userData.email}"),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(color: Color(0xFF171616)),
        child: Column(
          children: [
            Center(
              child: Container(
                width: MyUtility(context).width * 0.78,
                height: MyUtility(context).height * 0.85,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.57, -0.82),
                    end: const Alignment(-0.57, 0.82),
                    colors: [
                      const Color(0x19777777),
                      Colors.white.withOpacity(0.4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButtonMessage(
                              onPress: () {
                                navigateToPage(8);
                              },
                            ),
                            AddButton(
                              text: 'Email Data',
                              onPressed: () {
                                sendEmailData(context);
                              },
                            )
                          ],
                        ),
                      ),

                      // Details Section
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView(
                            children: [
                              ReqruitDetails(
                                year:
                                    job.dateSubmitted.toDate().year.toString(),
                                month:
                                    job.dateSubmitted.toDate().month.toString(),
                                day: job.dateSubmitted.toDate().day.toString(),
                                occupation: job.occupation,
                                contact: job.contactNumber,
                                name: job.name,
                                location:
                                    "${job.province} ${job.city} ${job.country}",
                                qualification: job.qualification,
                                years: job.years,
                                email: job.email,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
