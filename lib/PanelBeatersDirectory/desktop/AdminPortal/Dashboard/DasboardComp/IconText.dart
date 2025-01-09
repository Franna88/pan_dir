import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconText extends StatelessWidget {
  final String visitors;
  final String month;

  const IconText({super.key, required this.visitors, required this.month});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('images/Triangle.svg'),
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              visitors,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.6,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              month,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.6,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        )
      ],
    );
  }
}
