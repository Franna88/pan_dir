import 'package:flutter/material.dart';

class CustomPlanItem {
  final String question;
  List answer;

  CustomPlanItem({required this.question, required this.answer});

  void updateAnswer(bool isTrue, newAnswer) {
    if (isTrue == true) {
      answer.add(newAnswer);
    } else {
      answer.remove(newAnswer);
    }
    print(answer);
  }
}

class CustomPlanItems {
  List<CustomPlanItem> items = [
    CustomPlanItem(
        question: "How do you currently connect with potential customers?",
        answer: []),
    CustomPlanItem(
        question: "Do you offer after hours support or towing services?",
        answer: []),
    CustomPlanItem(
        question:
            "Would features like Whatsapp integration be valuable to you?",
        answer: []),
    CustomPlanItem(
        question:
            "Would it be beneficial to your business if customers could navigate to your premises via Google Maps?",
        answer: []),
    CustomPlanItem(
        question:
            "Do you have a website or social media presence you\'d like to link to?",
        answer: []),
    CustomPlanItem(
        question:
            "Are you interested in showcasing positive client reviews, ratings and feedback on your profile?",
        answer: []),
    CustomPlanItem(
        question:
            "Would having your services, OEM accreditations, insurance panels and staff information readily available online be beneficial?",
        answer: []),
    CustomPlanItem(
        question:
            "Does your customers have access to your updated business hours and other essential information?",
        answer: []),
    CustomPlanItem(question: "Are you currently a member of:", answer: []),
    CustomPlanItem(
        question: "How do you currently manage your booking schedule?",
        answer: []),
    CustomPlanItem(
        question:
            "Does your customers have access to your updated business hours and other essential information?",
        answer: []),
    CustomPlanItem(
        question: "Should customers be able to request a quotation online?",
        answer: []),
    CustomPlanItem(
        question:
            "Should customers be able to submit car photos for estimates?",
        answer: []),
    CustomPlanItem(
        question:
            "Do you see a benefit in having a platform to buy and sell parts and \nequipment with other panel beaters?",
        answer: []),
    CustomPlanItem(
        question:
            "Would you utilize a Job Finder platform to connect with industry talent?",
        answer: []),
    CustomPlanItem(
        question:
            "Would you be interested in a professional photo and/or video shoot?",
        answer: []),
    CustomPlanItem(
        question:
            "Would additional advertising opportunities within our platform be of interest to you?",
        answer: []),
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Map<String, dynamic> getValues() {
    Map<String, dynamic> values = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
    };
    List<Map<String, dynamic>> answers = [];
    for (CustomPlanItem item in items) {
      if (item.answer.length > 1) {
        String formattedAnswer = item.answer.join(', ');
        answers.add({'question': item.question, 'answer': formattedAnswer});
      } else {
        answers.add({'question': item.question, 'answer': item.answer.first});
      }
    }

    values['answers'] = answers;

    return values;
  }
}
