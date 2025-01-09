import 'package:flutter/material.dart';

class UserDetailsController {
  late TextEditingController dateReg;
  late TextEditingController dateUpdate;
  late TextEditingController email;
  late TextEditingController fullname;
  late TextEditingController secKey;
  late TextEditingController status;
  late TextEditingController userActive;
  late TextEditingController usercell;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController authId;
  UserDetailsController() {
    dateReg = TextEditingController();
    dateUpdate = TextEditingController();
    email = TextEditingController();
    fullname = TextEditingController();
    secKey = TextEditingController();
    status = TextEditingController();
    userActive = TextEditingController();
    usercell = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    authId = TextEditingController();
  }

  void dispose() {
    dateReg.dispose();
    dateUpdate.dispose();
    email.dispose();
    fullname.dispose();
    secKey.dispose();
    status.dispose();
    userActive.dispose();
    usercell.dispose();
    password.dispose();
    confirmPassword.dispose();
    authId.dispose();
  }

  void setValues(Map<String, dynamic> userData) {
    dateReg.text = userData['dateReg'] ?? '';
  }

  getValues(listingMembersId) {
    return {
      "dateReg": DateTime.now(),
      "dateUpdate": "dateReg.text",
      "email": email.text,
      "fullname": fullname.text,
      "listingMembersId": listingMembersId,
      "loginCount": 0,
      "password": "",
      "secKey": secKey.text,
      "status": "Active",
      "userActive": 1,
      "userActiveTime": "",
      "userGroupId": "",
      "userLogoutTime": "",
      "usercell": usercell.text,
      "username": "",
      "usertell": "",
      "authId": authId.text,
      "normalUser": true
    };
  }
}
