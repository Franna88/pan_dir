import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AgreementBallText extends StatelessWidget {
  String ballText;
  String boldText;
  AgreementBallText(
      {super.key, required this.ballText, required this.boldText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        width: 1110,
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
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: boldText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                ),
                TextSpan(
                  text: ballText,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.5),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
