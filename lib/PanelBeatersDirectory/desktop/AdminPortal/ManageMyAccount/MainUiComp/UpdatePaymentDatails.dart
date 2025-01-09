import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

import '../../AdminProfile/ProfileComp/buttons/AddButton.dart';
import '../ManageComponents/AccountLongTextField.dart';

class UpdatePaymentDetails extends StatefulWidget {
  const UpdatePaymentDetails({super.key});

  @override
  State<UpdatePaymentDetails> createState() => _UpdatePaymentDetailsState();
}

class _UpdatePaymentDetailsState extends State<UpdatePaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Update Payment Detail',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6064,
              fontFamily: 'ralewaybold',
            ),
          ),
          Text(
            'View and update your banking and payment detail',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.73,
              fontFamily: 'raleway',
            ),
          ),
          AccountDropDown(
            descriptionText: "Payment Plan",
            length: 0.37,
            selectedValue: 'Monthly EFT',
            options: ['Annual EFT', 'Monthly EFT', 'Weekly EFT'],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountDropDown(
                descriptionText: "Bank",
                length: 0.37,
                selectedValue: 'First National Bank',
                options: ['Annual EFT', 'First National Bank', 'Weekly EFT'],
              ),
              AccountLongTextField(
                descriptionText: 'Branch Code',
                length: 0.37,
                controller: null,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountDropDown(
                descriptionText: "Account Name",
                length: 0.37,
                selectedValue: 'N4 Autocraft',
                options: ['Annual EFT', 'N4 Autocraft', 'Weekly EFT'],
              ),
              AccountLongTextField(
                descriptionText: 'Account Number',
                length: 0.37,
                controller: null,
              ),
            ],
          ),
          AccountLongTextField(
            descriptionText: 'Membership Start Date',
            length: 0.9,
            controller: null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AddButton(text: "    Save    ", onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
