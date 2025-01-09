import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/ui/youtubeWatchButton.dart';

class YoutubeVideoBlock extends StatefulWidget {
  const YoutubeVideoBlock({super.key});

  @override
  State<YoutubeVideoBlock> createState() => _YoutubeVideoBlockState();
}

class _YoutubeVideoBlockState extends State<YoutubeVideoBlock> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: 1060,
      child: Stack(
        children: [
          Center(
            child: new ClipRect(
              child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: new Container(
                  width: widthDevice * 0.85,
                  height: 920,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.56, -0.83),
                      end: Alignment(-0.56, 0.83),
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.4),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0xBF000000),
                        blurRadius: 24,
                        offset: Offset(0, 4),
                        spreadRadius: -1,
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        SizedBox(
                          height: 70,
                          child: Text(
                            'The only panel you need to control:\n',
                            style: TextStyle(
                              color: Color(0xFFE5882F),
                              fontSize: widthDevice < 1110
                                  ? 50
                                  : widthDevice < 1500
                                      ? 55
                                      : 64.6,
                              fontFamily: 'ralewaybold',
                              height: 1,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: Color.fromARGB(255, 53, 53, 53),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: 900,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Your FREE* Listing',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widthDevice < 1500 ? 75 : 95.2,
                                  height: 1,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: widthDevice < 1500 ? 130 : 90,
                                  ),
                                  Image.asset('images/scribble.png',
                                      height: 80, fit: BoxFit.fill),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 745,
                          child: Text(
                            textAlign: TextAlign.center,
                            'Get found faster for collision repairs! Choose your plan, manage your listing, and attract more customers – all in minutes. Sign up today!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice < 1500 ? 19 : 23,
                              height: 1.2,
                              fontFamily: 'raleway',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        YoutubeWatchButton(),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 400,
                          color: Colors.black,
                          width: 750,
                          child: Center(
                            child: Text(
                              'Waiting for link',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              right: widthDevice > 1600 ? widthDevice / 15 : widthDevice / 17,
              bottom: 0,
              child: Image.asset(
                'images/gear3.png',
                height: 130,
              ))
        ],
      ),
    );
  }
}
