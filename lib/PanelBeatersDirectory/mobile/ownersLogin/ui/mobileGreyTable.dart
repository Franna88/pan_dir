import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileGreyTable extends StatelessWidget {
  Widget child;
  double width;
  MobileGreyTable({super.key,required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
              
              width: width,//125 //175
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 48, 48, 48),
                border: Border(
                  left: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                  top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                  right: BorderSide(color: Color(0xFF5B5B5B)),
                  bottom: BorderSide(color: Color(0xFF5B5B5B)),
                ),
              ),
              child: child,
            );
  }
}