import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future sendContactUsEmail({
  required String message,
  required String name,
  required String email,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'template_q6zdwqe';
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
          'user_name': name,
          'user_request': '${name}  -   ${email}'
        }
      }));

  print(response.body);
}
