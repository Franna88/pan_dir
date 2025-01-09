import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

import '../../AdminProfile/ProfileComp/buttons/AddButton.dart';
import '../ManageComponents/AccountLongTextField.dart';
import '../ManageComponents/AccountShortTextField.dart';
import '../ManageComponents/AccountTextField.dart';

class AccountManage extends StatefulWidget {
  const AccountManage({super.key});

  @override
  State<AccountManage> createState() => _AccountManageState();
}

class _AccountManageState extends State<AccountManage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.5,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Manage My Account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6064,
              fontFamily: 'ralewaybold',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: AccountShortTextField(
              descriptionText: 'Your Directory Membership Number: ',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountShortTextField(
                descriptionText: 'My Personal Relationship Manager: ',
              ),
              AccountTextField(
                length: 0.17,
                textColor: Color(0xFFFF8728),
              ),
              AccountTextField(
                length: 0.19,
                textColor: Color(0xFFFF8728),
              )
            ],
          ),
          AccountLongTextField(
            descriptionText: 'Finance Manager Name',
            length: 0.8,
            controller: null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AccountLongTextField(
                descriptionText: 'Finance Manager Name',
                length: 0.37,
                controller: null,
              ),
              AccountLongTextField(
                descriptionText: 'Finance Manager Name',
                length: 0.37,
                controller: null,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AddButton(text: "    Save    ", onPressed: () {}),
              ],
            ),
          )
        ],
      ),
    );
  }
}
