import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final String text1;
  final String text2;
  const CategoryText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (constraints, context) {
        if (widthDevice < 1500) {
          return SizedBox(
            width: 197,
            height: 77,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$text1\n',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: text2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return SizedBox(
            width: 197,
            height: 77,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$text1\n',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'raleway',
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: text2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'ralewaymedium',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}
