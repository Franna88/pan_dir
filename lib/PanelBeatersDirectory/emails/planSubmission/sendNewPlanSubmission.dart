import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future sendNewPlanSubmission({
  required String name,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'new_plan_submission';
  final userId = '0ZWNajCk0zcA8mXhu';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'name': name,
        }
      },
    ),
  );
  if (response.statusCode == 200) {
    print('OK');
  } else {
    print('Error sending email');
  }
}
