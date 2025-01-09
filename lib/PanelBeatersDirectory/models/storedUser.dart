import 'package:flutter/material.dart';

class StoredUser {
  final String id;
  final String memberId;
  final String membershipType;
  final String email;
  final String fullName;
  final String cell;

  StoredUser(
      {required this.id,
      required this.membershipType,
      required this.memberId,
      required this.email,
      required this.fullName,
      required this.cell});
}
