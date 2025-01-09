import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/customPlanItems.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/goBackButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/progressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/planSubmission/sendNewPlanSubmission.dart';

class ClientInfo extends StatefulWidget {
  final CustomPlanItems customItems;
  final Function closeDialog;
  final Function(String) updateIndex;
  const ClientInfo(
      {super.key,
      required this.closeDialog,
      required this.updateIndex,
      required this.customItems});

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {
  final firestore = FirebaseFirestore.instance;

  Future<void> storePlanInfo() async {
    try {
      Map<String, dynamic> data = widget.customItems.getValues();
      await firestore
          .collection('plan_info')
          .add({...data, "dateAdded": FieldValue.serverTimestamp()});
    } catch (e) {
      print('Error storing plan info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      //height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClosePageButton(
                closeDialog: widget.closeDialog,
              ),
              ProgressBar(
                orangeBar: Container(
                  width: 74.2 * 6,
                  height: 12,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEF9040),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(72.36),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Your Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'ralewaybold',
                      height: 1),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Almost there! We just need some of your information.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.699999988079071),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    ProfileTextField(
                        customWidth: 350.0,
                        controller: widget.customItems.nameController,
                        headline: 'Name',
                        customColor: Colors.black),
                    ProfileTextField(
                        customWidth: 350.0,
                        controller: widget.customItems.emailController,
                        headline: 'Email',
                        customColor: Colors.black),
                    ProfileTextField(
                        customWidth: 350.0,
                        controller: widget.customItems.phoneController,
                        headline: 'Phone Number',
                        customColor: Colors.black),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Row(
                  children: [
                    GoBackButton(
                      onGoBack: () => widget.updateIndex("-"),
                    ),
                    Spacer(),
                    NextButton(
                      onPressed: () async {
                        if (widget.customItems.nameController.text == "" ||
                            widget.customItems.emailController.text == "" ||
                            widget.customItems.phoneController.text == "") {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: DescriptionDialog(
                                  description: 'Please enter your details',
                                ),
                              );
                            },
                          );
                        }
                        // store answers in firebase
                        await storePlanInfo();
                        // TO DO: send email to admin
                        await sendNewPlanSubmission(
                            name: widget.customItems.nameController.text);
                        widget.updateIndex("+");
                      },
                      buttonText: 'Next',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
