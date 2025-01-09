import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';

class Button extends StatelessWidget {
  Color backgroundColor;
  Color circleColor;
  Color iconColor;
  String text1;
  Color textColor;
  Button(
      {super.key,
      required this.backgroundColor,
      required this.circleColor,
      required this.iconColor,
      required this.text1,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page4()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: iconColor,
                  size: 16,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                text1,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.5,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
