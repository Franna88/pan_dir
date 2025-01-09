import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class FooterMobileTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const FooterMobileTextButton(
      {Key? key, required this.text, required this.onpress});

  @override
  State<FooterMobileTextButton> createState() => _FooterMobileTextButtonState();
}

class _FooterMobileTextButtonState extends State<FooterMobileTextButton> {
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
