import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileQuestionPages/ui/mobileYoutubeButton.dart';

class MobileYoutubeVidBlock extends StatefulWidget {
  const MobileYoutubeVidBlock({super.key});

  @override
  State<MobileYoutubeVidBlock> createState() => _MobileYoutubeVidBlockState();
}

class _MobileYoutubeVidBlockState extends State<MobileYoutubeVidBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 550,
      child: Stack(children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: widthDevice * 0.91,
              height: 490,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.grey.shade200.withOpacity(0.3),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 22,
                    child: Text(
                      'The only panel you need to control:\n',
                      style: TextStyle(
                        color: Color(0xFFE5882F),
                        fontSize: widthDevice< 382 ? 18 : 20,
                        fontFamily: 'ralewaybold',
                        height: 1,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1, 1),
                            blurRadius: 1,
                            color: Color.fromARGB(255, 53, 53, 53),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your FREE* Listing',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          height: 1,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Image.asset(
                            'images/scribble.png',
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: widthDevice * 0.80,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Get found faster for collision repairs! Choose your plan, manage your listing, and attract more customers – all in minutes. Sign up today!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.2,
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MobileYoutubeButton(onPressed: () {}),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: widthDevice * 0.88,
                    height: 200,
                    color: Colors.black,
                    child: Center(
                        child: Text(
                      'Waiting for link',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
            child: Image.asset(
          'images/gear3.png',
          height: 90,
        ))
      ]),
    );
  }
}
