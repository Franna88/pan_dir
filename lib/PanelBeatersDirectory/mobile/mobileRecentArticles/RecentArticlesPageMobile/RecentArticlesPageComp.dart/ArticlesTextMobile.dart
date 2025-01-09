import 'package:flutter/material.dart';

class ArticlesTextMobile extends StatelessWidget {
  final String headline;
  final String paragraphText;

  const ArticlesTextMobile(
      {super.key, required this.headline, required this.paragraphText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 770.8,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${headline} \n',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.4,
                  fontFamily: 'ralewaysemi',
                  fontWeight: FontWeight.w600,
                  height: 2.5),
            ),
            TextSpan(
              text: '${paragraphText} \n\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
