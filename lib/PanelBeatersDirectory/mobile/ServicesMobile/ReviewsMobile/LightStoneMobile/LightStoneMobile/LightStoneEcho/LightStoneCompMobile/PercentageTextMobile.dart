import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

class PercentageTextMobile extends StatelessWidget {
  final String percentage;

  const PercentageTextMobile({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total score',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0684,
            fontFamily: 'ralewaysemi',
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.14,
          height: MyUtility(context).height * 0.04,
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
              fontSize: 21.42,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
