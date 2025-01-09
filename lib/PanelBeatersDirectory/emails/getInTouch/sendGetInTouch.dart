import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future sendGetInTouch({
  required String firstName,
  required String lastName,
  required String email,
  required String phone,
  required String message,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'template_g4f3vyg';
  final userId = '0ZWNajCk0zcA8mXhu';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'message': message,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone': phone,
        }
      }));

  if (response.statusCode == 200) {
    print('OK');
  } else {
    print('email error');
  }
}
