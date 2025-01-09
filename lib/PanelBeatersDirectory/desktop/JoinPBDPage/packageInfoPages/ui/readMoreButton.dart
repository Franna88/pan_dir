import 'package:flutter/material.dart';

class ReadMoreButton extends StatelessWidget {
  Color backgroundColor1;
  Color circleColor1;
  Color iconColor1;
  Color textColor1;
  String text1;
  Function() onTap;

  ReadMoreButton(
      {super.key,
      required this.backgroundColor1,
      required this.onTap,
      required this.circleColor1,
      required this.iconColor1,
      required this.text1,
      required this.textColor1});

  @override
  Widget build(BuildContext context) {
    return Container(
      /*width: MediaQuery.of(context).size.width * 0.08,*/
      /*height: MediaQuery.of(context).size.height * 0.05,*/
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 6, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: circleColor1,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: iconColor1,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                text1,
                style: TextStyle(
                  color: textColor1,
                  fontSize: 15,
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
