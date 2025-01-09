import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendExpiredDocNotification({
  required String userName,
  required String userEmail,
  required String expiredDocsList,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'job_finder_submission';
  final userId = '0ZWNajCk0zcA8mXhu';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_email': userEmail,
          'user_name': userName,
          'expired_docs_list': expiredDocsList,
        }
      }));

  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
