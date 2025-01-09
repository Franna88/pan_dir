import 'package:flutter/material.dart';

class PackageBenefitsText extends StatelessWidget {
  String boldText;
  String text;
  PackageBenefitsText({super.key, required this.boldText, required this.text});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.black,
              size: 18,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: boldText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice / 94,
                    fontFamily: 'ralewaybold',
                    
                    
                  ),
                ),
                TextSpan(
                  text:
                      text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice / 99,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
