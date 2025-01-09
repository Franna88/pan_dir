import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> sendJobFinderDataOP({
  required String userName,
  required String userEmail,
  required String jobFinderName,
  required String datePublished,
  required String occupation,
  required String yearsExperience,
  required String areaOfWork,
  required String contactNumber,
  required String jobFinderEmail,
}) async {
  final serviceId = 'service_qxhqzd9';
  final templateId = 'job_finder_data';
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
          'job_finder_name': jobFinderName,
          'date_published': datePublished,
          'occupation': occupation,
          'years_experience': yearsExperience,
          'area_of_work': areaOfWork,
          'contact_number': contactNumber,
          'job_finder_email': jobFinderEmail
        }
      }));

  print(response.body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
