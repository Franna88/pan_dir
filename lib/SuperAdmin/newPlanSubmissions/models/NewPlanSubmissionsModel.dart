import 'package:cloud_firestore/cloud_firestore.dart';

class NewPlanSubmissionsModel {
  final List<Map<String, dynamic>> answers;
  final Timestamp dateAdded;
  final String name;
  final String email;
  final String phoneNumber;

  NewPlanSubmissionsModel({
    required this.answers,
    required this.dateAdded,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory NewPlanSubmissionsModel.fromMap(Map<String, dynamic> map) {
    return NewPlanSubmissionsModel(
      answers: List<Map<String, dynamic>>.from(map['answers']),
      dateAdded: map['dateAdded'],
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phone'],
    );
  }
}
