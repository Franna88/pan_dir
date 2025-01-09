import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

createOtpVerification(email, otpCode) async {
  //check if otp req made previously
  // if true remove and send new otp
  final checkIfEmailAlreadyReq = await FirebaseFirestore.instance
      .collection('validateEmailOtp')
      .limit(10)
      .where('email', isEqualTo: email)
      .get();

  for (var doc in checkIfEmailAlreadyReq.docs) {
    String id = doc.get('id');

    FirebaseFirestore.instance.collection('validateEmailOtp').doc(id).delete();
  }

  var otpVerificationData = {
    "email": email,
    "otpCode": otpCode,
    "date": DateTime.now(),
    "id": ""
  };

  final doc = FirebaseFirestore.instance.collection('validateEmailOtp').doc();

  otpVerificationData["id"] = doc.id;

  final json = otpVerificationData;
  doc.set(json);
}

Future<bool> sendOtpEmail({
  required String otp,
  required String email,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'template_k8ip3mq';
  final userId = '0ZWNajCk0zcA8mXhu';
  createOtpVerification(email, otp);
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {'otp_number': otp, 'to_email': email, 'to_name': ''}
      }));

  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
