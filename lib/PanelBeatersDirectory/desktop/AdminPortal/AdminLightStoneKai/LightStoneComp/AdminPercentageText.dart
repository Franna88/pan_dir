import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AdminPercentageText extends StatelessWidget {
  final String percentage;

  const AdminPercentageText({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total score',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.016,
            fontFamily: 'ralewaysemi',
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.06,
          height: MyUtility(context).height * 0.06,
          decoration: ShapeDecoration(
            color: Color(0xFFC40D0D),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.13),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4.45,
                offset: Offset(0, 4.45),
                spreadRadius: 0,
              )
            ],
          ),
          child: Text(
            '$percentage%',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyUtility(context).width * 0.021,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
