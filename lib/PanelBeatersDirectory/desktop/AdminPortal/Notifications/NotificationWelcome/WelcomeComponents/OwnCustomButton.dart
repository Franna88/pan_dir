import 'package:flutter/material.dart';

import 'CommonColor.dart';

class OwnCustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double? width; // Optional width parameter
  final double? height;
  final double? fontSize; // Optional height parameter

  const OwnCustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.white,
    this.width,
    this.height,
    this.fontSize,
  }) : super(key: key);

  @override
  State<OwnCustomButton> createState() => _OwnCustomButtonState();
}

class _OwnCustomButtonState extends State<OwnCustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 70,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CommonColor().Colors3,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize ?? 22,
          ),
        ),
      ),
    );
  }
}
