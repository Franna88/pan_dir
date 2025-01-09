import 'package:flutter/material.dart';

class ArticlesText extends StatelessWidget {
  final String headline;
  final String paragraphText;

  const ArticlesText(
      {super.key, required this.headline, required this.paragraphText});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 770.8,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: '${headline} \n',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23.8,
                  fontFamily: 'ralewaysemi',
                  fontWeight: FontWeight.w600,
                  height: 2.5),
            ),
            TextSpan(
              text: '${paragraphText} \n\n',
              style: TextStyle(
                color: Colors.black,
                fontSize: widthDevice < 1500 ? 18 : 20.4,
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
