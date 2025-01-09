import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/advancedFeaturesMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/businesOperationsMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/clientCommunicationMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/clientManagementMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/letsFindYourPlanMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/onlinePresenceMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/customPlanItems/weAreDoneMobile.dart';

class CustomPlanMobile extends StatefulWidget {
  Function closeDialog;
  CustomPlanMobile({super.key, required this.closeDialog});

  @override
  State<CustomPlanMobile> createState() => _CustomPlanMobileState();
}

class _CustomPlanMobileState extends State<CustomPlanMobile> {
  var planIndex = 0;

  //update pageIndex index
  nextQuestions(value) {
    if (planIndex > -1 && planIndex < 7) {
      setState(() {
        if (value == '+') {
          planIndex = planIndex + 1;
        } else {
          planIndex = planIndex - 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var customPlanPages = [
      LetsFindYourPlanMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      ClientCommunicationMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      OnlinePresenceMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      BusinessOperationsMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      ClientManagementMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      AdvancedFeaturesMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
      WeAreDoneMobile(
        nextQuestions: nextQuestions,
        closeDialog: widget.closeDialog,
      ),
    ];

    return customPlanPages[planIndex];
  }
}
