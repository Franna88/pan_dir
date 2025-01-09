import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MobileAttentionBlock extends StatefulWidget {
  const MobileAttentionBlock({super.key});

  @override
  State<MobileAttentionBlock> createState() => _MobileAttentionBlockState();
}

class _MobileAttentionBlockState extends State<MobileAttentionBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      //color: Colors.amber,
      height: 675,
      width: widthDevice * 0.88,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 600,
              width: widthDevice * 0.88,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'images/imageStack2.png',
                      height: heightDevice * 0.28,
                    ),
                    SizedBox(
                      //width: widthDevice * 0.29,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Attention ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontFamily: 'ralewaybold',
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text: 'Motorists',
                              style: TextStyle(
                                color: Color(0xFFE5882F),
                                fontSize: 35,
                                fontFamily: 'ralewaybold',
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\n\nDitch the stress and find the perfect fit! Our user friendly platform connects you with trusted Auto Body Repairers instantly. Compare options, read real reviews, and make informed decisions. Save time & money - it\'s all here.',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'raleway',
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              text: '\n\nComing soon, the WATIF App. ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'raleway',
                                height: 1,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer(),
                              text: 'Your AI Co-Driver ',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 16,
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
            bottom: 0,
            child: Image.asset(
              'images/gear2.png',
              height: 80,
            ),
          )
        ],
      ),
    );
  }
}
