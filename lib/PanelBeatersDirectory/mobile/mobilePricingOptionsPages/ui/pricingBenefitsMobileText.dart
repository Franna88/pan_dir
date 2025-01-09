import 'package:flutter/material.dart';

class PricingBenefitsMobileText extends StatelessWidget {
  
  
  Color textColor;
  String text;
  PricingBenefitsMobileText(
      {super.key,
      
      
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Color(0xFFE2822B),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontFamily: 'raleway',
              
              
            ),
            
          )
        ],
      ),
    );
  }
}
