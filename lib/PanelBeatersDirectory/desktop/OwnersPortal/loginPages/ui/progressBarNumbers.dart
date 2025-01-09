import 'package:flutter/cupertino.dart';

class ProgressBarNumbers extends StatelessWidget {
  String number;
  ProgressBarNumbers({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice < 1500
        ? Positioned(
            left: 5,
            top: 5,
            child: Text(
              //NUMBER
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5F6368),
                fontSize: 8,
                
                
                height: 0,
              ),
            ),
          )
        : Positioned(
            left: 5.1,
            top: 5.1,
            child: Text(
              //NUMBER
              number,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF5F6368),
                fontSize: 13,
                
                
                height: 0,
              ),
            ),
          );
  }
}
