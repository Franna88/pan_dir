import 'package:flutter/material.dart';

class BusinessProfileItem {
  String data;
  TextEditingController controller;

  BusinessProfileItem({required this.data})
      : controller = TextEditingController(text: data);

  void dispose() {
    controller.dispose();
  }

  void setValue(String value) {
    data = value;
    controller.text = value;
  }
}
