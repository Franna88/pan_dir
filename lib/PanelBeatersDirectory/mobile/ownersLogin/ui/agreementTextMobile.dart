import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AgreementTextMobile extends StatelessWidget {
  String ballText;
  String boldText;
  AgreementTextMobile(
      {super.key, required this.ballText, required this.boldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Icon(
              Icons.circle,
              color: Colors.white,
              size: 5,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: boldText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'ralewaybold',
                      
                      height: 1.5),
                ),
                TextSpan(
                  text: ballText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'raleway',
                      
                      height: 1.5),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
