import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ReUseableText extends StatelessWidget {
  final String percentage;
  final String cv;

  const ReUseableText({super.key, required this.percentage, required this.cv});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          percentage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFDC7825),
            fontSize: MyUtility(context).width * 0.020,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          cv,
          style: TextStyle(
            color: Color(0xFFF4F4F4),
            fontSize: MyUtility(context).width * 0.01,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
            letterSpacing: 0.69,
          ),
        )
      ],
    );
  }
}
