import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
// Import your stored user model

final storage = FlutterSecureStorage();

Future<StoredUser?> getUserInfo() async {
  String? userJson = await storage.read(key: 'user');
  if (userJson != null) {
    Map<String, dynamic> userMap = jsonDecode(userJson);
    return fromJson(userMap);
  }
  return null;
}

StoredUser fromJson(Map<String, dynamic> json) {
  return StoredUser(
    id: json['id'],
    email: json['email'],
    membershipType: json['membership_type'],
    memberId: json['member_id'],
    fullName: json['full_name'],
    cell: json['cell'],
  );
}

Future<String?> GetListingId() async {
  String? listingId = await storage.read(key: 'id');

  if (listingId != null) {
    return listingId;
  }
  return null;
}
