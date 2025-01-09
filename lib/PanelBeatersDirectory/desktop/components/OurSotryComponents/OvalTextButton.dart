import 'package:flutter/material.dart';

class OvalTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OvalTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF0E1013),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'raleway',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
