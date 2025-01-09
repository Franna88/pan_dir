import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PanMobileTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const PanMobileTextButton(
      {Key? key, required this.text, required this.onpress});

  @override
  State<PanMobileTextButton> createState() => _PanMobileTextButtonState();
}

class _PanMobileTextButtonState extends State<PanMobileTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextButton(
        onPressed: widget.onpress,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'raleway',
              color: Color(0xFFF4F4F4),
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}