import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriverComponents/AiCoDriverButton.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriverComponents/LearnMoreButton.dart';
import 'package:webdirectories/WebDirectories/Page5/Page5.dart';
import 'package:webdirectories/myutility.dart';

import '../../Page4/Page4.dart';

class AiCoDriver extends StatefulWidget {
  const AiCoDriver({super.key});

  @override
  State<AiCoDriver> createState() => _AiCoDriverState();
}

class _AiCoDriverState extends State<AiCoDriver> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.1,
                  ),
                  SizedBox(
                    //width: MyUtility(context).width / 3.5,
                    height: MyUtility(context).height * 0.6,
                    child: Image.asset(
                      'images/3mobile.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MyUtility(context).width / 2.75,
                height: MyUtility(context).height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MyUtility(context).height * 0.1,
                    ),
                    const Text(
                      "Your AI Co-Driver",
                      style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'ralewaysemi',
                          color: Colors.black),
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Download your ",
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'ralewaysemi',
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'WATIF App ',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'comfortaaBold',
                              color: Color.fromRGBO(149, 160, 4, 1),
                            ),
                          ),
                          TextSpan(
                            text: 'today!',
                            style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'ralewaysemi',
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.01,
                    ),
                    Text.rich(
                      TextSpan(
                        text:
                            'Hit the road with confidence and ditch the stress with ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'raleway',
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'watif!',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'comfortaaBold',
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text:
                                ' This is your free, all-in-one automotive app that empowers you with everything you need.',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.04,
                    ),
                    Row(
                      children: [
                        AiCoDriverButton(
                            image: 'images/AppleStore.png', onpress: () {}),
                        AiCoDriverButton(
                            image: 'images/Google Play.png', onpress: () {}),
                        AiCoDriverButton(
                            image: 'images/WindowsStore.png', onpress: () {}),
                      ],
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    LearnMoreButton(
                        buttonText: 'Learn More',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Material(
                                        child: Page4(),
                                      )));
                        }),
                    SizedBox(
                      height: MyUtility(context).height * 0.01,
                    ),
                    Container(
                      width: MyUtility(context).width * 0.08,
                      height: 30,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/stars.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.1,
          ),
        ],
      ),
    );
  }
}
