import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterBusinessValues {
  late TextEditingController memberShipType;
  late TextEditingController membershipRef;
  late TextEditingController tradingName;
  late TextEditingController registeredBussinessName;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController country;
  late TextEditingController suburb;
  late TextEditingController province;
  late TextEditingController streetAddress;
  late TextEditingController city;
  late TextEditingController postal;
  late TextEditingController password;

  late TextEditingController ip;
  late TextEditingController date;

  late TextEditingController bankAccName;
  late TextEditingController bankName;
  late TextEditingController branchCode;
  late TextEditingController accNumber;
  late TextEditingController accType;
  late TextEditingController commenceDate;
  late TextEditingController paymentDate;

  RegisterBusinessValues() {
    memberShipType = TextEditingController();
    membershipRef = TextEditingController();
    tradingName = TextEditingController();
    registeredBussinessName = TextEditingController();
    firstName = TextEditingController();
    lastName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();

    country = TextEditingController();
    suburb = TextEditingController();
    province = TextEditingController();
    streetAddress = TextEditingController();
    city = TextEditingController();
    postal = TextEditingController();
    password = TextEditingController();

    ip = TextEditingController();
    date = TextEditingController();

    bankAccName = TextEditingController();
    bankName = TextEditingController();
    branchCode = TextEditingController();
    accNumber = TextEditingController();
    accType = TextEditingController();
    commenceDate = TextEditingController();
    paymentDate = TextEditingController();
  }

  void dispose() {
    memberShipType.dispose();
    membershipRef.dispose();
    tradingName.dispose();
    registeredBussinessName.dispose();
    firstName.dispose();
    lastName.dispose();
    phone.dispose();
    email.dispose();

    country.dispose();
    suburb.dispose();
    province.dispose();
    city.dispose();
    postal.dispose();

    ip.dispose();
    date.dispose();

    bankAccName.dispose();
    bankName.dispose();
    branchCode.dispose();
    accNumber.dispose();
    accType.dispose();
    commenceDate.dispose();
    paymentDate.dispose();
  }

  void setValues(Map<String, dynamic> userData) {
    tradingName.text = userData['title'] ?? '';
    firstName.text = userData['firstName'] ?? '';
    lastName.text = userData['lastName'] ?? '';
    phone.text = userData['phone'] ?? '';
    email.text = userData['email'] ?? '';
  }

  getListingAllocations(
      {required int listingid,
      required int memberlistingId,
      required int allocationId}) {
    return {
      "allocationId": allocationId,
      "dateAdded": DateTime.now(),
      "listingMembersId": memberlistingId,
      "listingsId": listingid,
      "membersId": null,
    };
  }

  //Values for listing_members collection
  getListingMembersValue(id) {
    return {
      "dateReg": DateTime.now(),
      "dateUpdate": "Null",
      "email": email.text,
      "fullname": "${firstName.text} ${lastName.text}",
      "listingMembersId": id,
      "authId": id,
      "loginCount": 0,
      "password": "",
      "secKey": "",
      "status": 1,
      "userActive": "NULL",
      "userActiveTime": "",
      "userDob": "",
      "userGroupId": 0,
      "userLogoutTime": "",
      "usercell": phone.text,
      "username": "",
      "usertell": "",
    };
  }

  //Values for listing collection
  getValues() {
    return {
      "accountTypeId": "",
      "accountname": bankAccName.text,
      "accountnumber": accNumber.text,
      "afterHoursClicks": 0,
      "alternativeNumber": "",
      "bank": bankName.text,
      "beecertexpirydate": "",
      "beerating": "",
      "branchcode": branchCode.text,
      "businessAfterhours": "",
      "businessEmail": email.text,
      "businessFaxnumber": "",
      "businessTelephone": phone.text,
      "cap": "",
      "cityId": "",
      "consultantId": "",
      "contactClicks": "",
      "contactEnd": "",
      "contactListing": "",
      "contactStart": "",
      "countryId": "",
      "csirating": "",
      "dateModified": "",
      "directoryMembershipNumber": "",
      "emailClicks": "",
      "faxClicks": "",
      "featuredEnd": "",
      "featuredStart": "",
      "financeManagerEmail": "",
      "financeManagerName": "",
      "formattedAddress": "",
      "googlegps": "",
      "gpsCoordinates": "",
      "hubspotLink": "",
      "latitude": "",
      "listingClicks": "",
      "longitude": 0,
      "mapStatus": 0,
      "membersId": "",
      "listingsId": "",
      "auth_id": "",
      "provinceId": "",
      "registeredBussinessName": "",
      "isActive": 0,
      "textMessageNumber": "",
      "whatsappNumber": "",
      "title": "",
      "listingLogo": "004_1.jpg",
      "displayphoto": "004_1.jpg",
      "featured": 1,
      "tradingName": tradingName.text,
      "registeredBussinessName": registeredBussinessName.text,
      "firstName": firstName.text,
      "lastName": lastName.text,
      "country": country.text,
      "suburb": suburb.text,
      "province": province.text,
      "streetAddress": streetAddress.text,
      "city": city.text,
      "postal": postal.text,
      "postaladdress": postal.text,
      "ip": ip.text,
      "dateAdded": Timestamp.fromDate(DateTime.now()),
      "membershipType": memberShipType.text,
      "membershipRef": membershipRef.text,
      "newRegistration": 1,
      "pendingApproval": 1
    };
  }
}/*
packageOptionId
payProblem
payProblemDate
payProblemReason
phoneClicks
popupEmail
postaladdress
profileAdministratorEmail
profileAdministratorName
quoteClicks*/