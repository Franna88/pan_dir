import 'package:flutter/material.dart';

class WeBullet extends StatelessWidget {
  final String text;
  final String subheading;

  const WeBullet(this.text, {required this.subheading, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bullet symbol
          Text(
            "  •   ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          // Text with subheading and normal text combined
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'raleway',
                ),
                children: [
                  TextSpan(
                    text: subheading,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ralewaysemi',
                    ),
                  ),
                  TextSpan(
                    text: " $text",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
