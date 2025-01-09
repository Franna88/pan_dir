import 'package:cloud_firestore/cloud_firestore.dart';

class JobFinderModel {
  final String name;
  final String qualification;
  final String contactNumber;
  final Timestamp dateSubmitted;
  final String email;
  final String country;
  final String city;
  final String province;
  final String occupation;
  final String years;

  JobFinderModel(
      {required this.name,
      required this.qualification,
      required this.contactNumber,
      required this.dateSubmitted,
      required this.email,
      required this.country,
      required this.city,
      required this.province,
      required this.occupation,
      required this.years});
}
