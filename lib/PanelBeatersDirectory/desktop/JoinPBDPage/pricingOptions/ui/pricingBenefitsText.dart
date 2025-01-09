import 'package:flutter/material.dart';

class PricingBenefitsText extends StatelessWidget {
  final Color circleColor;
  final Color textColor;
  final String text;

  PricingBenefitsText({
    required this.circleColor,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
          SizedBox(width: 5),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                  color: textColor,
                  fontSize: widthDevice * 0.009,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
