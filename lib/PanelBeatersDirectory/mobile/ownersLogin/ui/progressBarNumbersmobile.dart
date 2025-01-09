import 'package:flutter/cupertino.dart';

class ProgressBarNumbersMobile extends StatelessWidget {
  String number;
  ProgressBarNumbersMobile({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 4,
      top: 9,
      child: Text(
        //NUMBER
        number,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xFF5F6368),
          fontSize: 10,
          fontFamily: 'raleway',
          
          height: 0,
        ),
      ),
    );
  }
}
