import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/MainUiComp/AccountManage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/MainUiComp/UpdatePaymentDatails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountLongTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountShortTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountTextField.dart';
import 'package:webdirectories/myutility.dart';

import '../Dashboard/DashboardContainers/DashProfileView.dart';
import 'MainUiComp/ViewRecords.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          children: [
            Container(
              width: 1487,
              height: MyUtility(context).height * 0.85,
              decoration: ShapeDecoration(
                color: Color(0xFF181B1D),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.64,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(9.57),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AccountManage(),
                      ViewRecords(),
                      UpdatePaymentDetails()
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
