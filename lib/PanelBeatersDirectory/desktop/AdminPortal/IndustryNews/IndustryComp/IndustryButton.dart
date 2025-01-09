import 'package:flutter/material.dart';

class IndustryButton extends StatefulWidget {
  const IndustryButton({super.key});

  @override
  State<IndustryButton> createState() => _IndustryButtonState();
}

class _IndustryButtonState extends State<IndustryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          Icons.keyboard_arrow_right_rounded,
          color: Color(0xFF0E1013),
          size: 37.0,
        ),
      ),
    );
  }
}
