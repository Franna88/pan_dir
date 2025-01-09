import 'package:flutter/material.dart';

class NumberProgressBarMobile extends StatelessWidget {
  Widget number1;
  Widget number2;
  Widget number3;
  Widget number4;
  Widget number5;
  Color color1;
  Color color2;
  Color color3;
  Color color4;

  NumberProgressBarMobile(
      {super.key,
      required this.number1,
      required this.number2,
      required this.number3,
      required this.number4,
      required this.number5,
      required this.color1,
      required this.color2,
      required this.color3,
      required this.color4});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.3, color: Color(0xFF5F6368)),
                        ),
                      ),
                    ),
                  ),
                  number1
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
          width: widthDevice * 0.10,
          child: new Center(
            child: new Container(
                margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                height: 2,
                color: color1 //const Color.fromARGB(255, 114, 113, 113),
                ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.3, color: Color(0xFF5F6368)),
                        ),
                      ),
                    ),
                  ),
                  number2
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
          width: widthDevice * 0.10,
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2,
              color: color2,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.3, color: Color(0xFF5F6368)),
                        ),
                      ),
                    ),
                  ),
                  number3
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
          width: widthDevice * 0.10,
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2,
              color: color3,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.3, color: Color(0xFF5F6368)),
                        ),
                      ),
                    ),
                  ),
                  number4
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
          width: widthDevice * 0.10,
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
              height: 2,
              color: color4,
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              width: 20,
              height: 20,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(
                          side:
                              BorderSide(width: 0.3, color: Color(0xFF5F6368)),
                        ),
                      ),
                    ),
                  ),
                  number5
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
