import 'package:flutter/material.dart';

class MobileWhiteContainer extends StatelessWidget {
  Widget child;
  MobileWhiteContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        width: widthDevice * 0.85,
        height: heightDevice * 0.70,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: child
      ),
    );
  }
}
