import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AttentionMotoristsBlock extends StatefulWidget {
  const AttentionMotoristsBlock({super.key});

  @override
  State<AttentionMotoristsBlock> createState() =>
      _AttentionMotoristsBlockState();
}

class _AttentionMotoristsBlockState extends State<AttentionMotoristsBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        children: [
          Container(
            //color: Colors.amber,
            height: heightDevice * 0.475,
            width: widthDevice * 0.85,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: widthDevice * 0.75,
                    decoration: BoxDecoration(
                      color: Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'images/imageStack2.png',
                            height: heightDevice * 0.30,
                          ),
                          SizedBox(
                            width: widthDevice * 0.33,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Attention ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: heightDevice < 710
                                          ? 25
                                          : widthDevice < 1500
                                              ? 30
                                              : 40,
                                      fontFamily: 'ralewaybold',
                                      height: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Motorists',
                                    style: TextStyle(
                                      color: Color(0xFFE5882F),
                                      fontSize: heightDevice < 710
                                          ? 25
                                          : widthDevice < 1500
                                              ? 30
                                              : 40,
                                      fontFamily: 'ralewaybold',
                                      height: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\n\nDitch the stress and find the perfect fit! Our\nuser friendly platform connects you with trusted\nAuto Body Repairers instantly. Compare\noptions, read real reviews, and make informed\ndecisions. Save time & money - it\'s all here.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: heightDevice < 710
                                          ? 16
                                          : widthDevice < 1500
                                              ? 20.4
                                              : 22,
                                      fontFamily: 'raleway',
                                      height: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\n\nComing soon, the WATIF App. ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: heightDevice < 710
                                          ? 16
                                          : widthDevice < 1500
                                              ? 18
                                              : 22,
                                      fontFamily: 'raleway',
                                      height: 1,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer(),
                                    text: 'Your AI Co-Driver ',
                                    style: TextStyle(
                                      color: Color(0xFFEF9040),
                                      fontSize: heightDevice < 710
                                          ? 16
                                          : widthDevice < 1500
                                              ? 18
                                              : 22,
                                      fontFamily: 'raleway',
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFFEF9040),
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 17,
                  left: 50,
                  child: Image.asset(
                    'images/gear2.png',
                    height: 130,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
