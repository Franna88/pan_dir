import 'package:cloud_firestore/cloud_firestore.dart';

class TeamMemberProfile {
  String image;
  String firstName;
  String surname;
  String position;

  TeamMemberProfile(
      {required this.image,
      required this.firstName,
      required this.surname,
      required this.position});

  factory TeamMemberProfile.fromMap(Map<String, dynamic> data) {
    return TeamMemberProfile(
      image: data['personPhoto'],
      firstName: data['firstName'],
      surname: data['surname'],
      position: data['shortDescription'],
    );
  }
}
