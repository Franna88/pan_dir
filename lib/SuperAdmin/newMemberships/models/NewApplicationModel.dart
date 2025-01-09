import 'package:cloud_firestore/cloud_firestore.dart';

class NewApplicationModel {
  final int id;
  final String accountName;
  final String accountNumber;
  final int afterHoursClicks;
  final String bank;
  final String branchCode;
  final String city;
  final int consultantId;
  final String country;
  final String email;
  final int featured;
  final String firstName;
  final String lastName;
  final double longitude;
  final int mapStatus;
  final String membershipRef;
  final String membershipType;
  final int pendingApproval;
  final String phone;
  final String postal;
  final String postalAddress;
  final String province;
  final String registeredBusinessName;
  final String streetAddress;
  final String suburb;
  final String tradingName;
  final String ip;
  final DateTime dateAdded;
  final String listingLogo;
  final String displayPhoto;
  final int isActive;

  NewApplicationModel({
    required this.id,
    required this.accountName,
    required this.accountNumber,
    required this.afterHoursClicks,
    required this.bank,
    required this.branchCode,
    required this.city,
    required this.consultantId,
    required this.country,
    required this.email,
    required this.featured,
    required this.firstName,
    required this.lastName,
    required this.longitude,
    required this.mapStatus,
    required this.membershipRef,
    required this.membershipType,
    required this.pendingApproval,
    required this.phone,
    required this.postal,
    required this.postalAddress,
    required this.province,
    required this.registeredBusinessName,
    required this.streetAddress,
    required this.suburb,
    required this.tradingName,
    required this.ip,
    required this.dateAdded,
    required this.listingLogo,
    required this.displayPhoto,
    required this.isActive,
  });

  factory NewApplicationModel.fromMap(Map<String, dynamic> map) {
    return NewApplicationModel(
      id: map['listingsId'] ?? '',
      accountName: map['accountname'] ?? '',
      accountNumber: map['accountnumber'] ?? '',
      afterHoursClicks: map['afterHoursClicks'] ?? 0,
      bank: map['bank'] ?? '',
      branchCode: map['branchcode'],
      city: map['city'] ?? '',
      consultantId: map['consultantId'] ?? '',
      country: map['country'] ?? '',
      email: map['businessEmail'] ?? '',
      featured: map['featured'] ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      longitude: map['longitude']?.toDouble() ?? 0.0,
      mapStatus: map['mapStatus'] ?? 0,
      membershipRef: map['membershipRef'] ?? '',
      membershipType: map['membershipType'] ?? '',
      pendingApproval: map['pendingApproval'] ?? 0,
      phone: map['businessTelephone'] ?? '',
      postal: map['postal'] ?? '',
      postalAddress: map['postaladdress'] ?? '',
      province: map['province'] ?? '',
      registeredBusinessName: map['registeredBussinessName'] ?? '',
      streetAddress: map['streetAddress'] ?? '',
      suburb: map['suburb'] ?? '',
      tradingName: map['tradingName'] ?? '',
      ip: map['ip'] ?? '',
      dateAdded: map['dateAdded'] != null
          ? (map['dateAdded'] as Timestamp).toDate()
          : DateTime.now(),
      listingLogo: map['listingLogo'] ?? '',
      displayPhoto: map['displayphoto'] ?? '',
      isActive: map['isActive'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listingsId': id,
      'accountname': accountName,
      'accountnumber': accountNumber,
      'afterHoursClicks': afterHoursClicks,
      'bank': bank,
      'branchcode': branchCode,
      'city': city,
      'consultantId': consultantId,
      'country': country,
      'email': email,
      'featured': featured,
      'firstName': firstName,
      'lastName': lastName,
      'longitude': longitude,
      'mapStatus': mapStatus,
      'membershipRef': membershipRef,
      'membershipType': membershipType,
      'pendingApproval': pendingApproval,
      'phone': phone,
      'postal': postal,
      'postaladdress': postalAddress,
      'province': province,
      'registeredBussinessName': registeredBusinessName,
      'streetAddress': streetAddress,
      'suburb': suburb,
      'tradingName': tradingName,
      'ip': ip,
      'dateAdded': dateAdded,
      'listingLogo': listingLogo,
      'displayphoto': displayPhoto,
      'isActive': isActive,
    };
  }
}
