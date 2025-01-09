import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class DiscountTag extends StatefulWidget {
  @override
  _DiscountTagState createState() => _DiscountTagState();
}

class _DiscountTagState extends State<DiscountTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.22,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
      decoration: ShapeDecoration(
        color: Color(0xFF4B4B4B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          // SVG image
          SvgPicture.asset(
            'images/DiscountTag.svg',
            width: 15,
            height: 15,
          ),
          SizedBox(width: 5),
          // Text
          Text(
            '5% discount',
            style: TextStyle(
              color: Colors.white,
              fontSize: 9.5,
              fontFamily: 'ralewaymedium',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
