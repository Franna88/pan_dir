import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriverComponents/AiCoDriverButton.dart';
import 'package:webdirectories/WebDirectories/Page4/DownloadWatif/DownloadWatifComponents/WatifContactUs.dart';
import 'package:webdirectories/WebDirectories/Page4/Page4.dart';
import 'package:webdirectories/WebDirectories/Page5/Page5.dart';
import 'package:webdirectories/WebDirectories/Page6/Page6.dart';
import 'package:webdirectories/WebDirectories/Page7/Page7.dart';
import 'package:webdirectories/myutility.dart';

class DownloadWatif extends StatefulWidget {
  const DownloadWatif({super.key});

  @override
  State<DownloadWatif> createState() => _DownloadWatifState();
}

class _DownloadWatifState extends State<DownloadWatif> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF0E1013),
          border: Border(
              bottom: BorderSide(
                  color: Colors.white.withOpacity(0.38), width: 0.5))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MyUtility(context).width / 3.0,
                height: MyUtility(context).height * 0.7,
                child: Image.asset(
                  'images/coffeegirl.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: MyUtility(context).width / 2.8,
                height: MyUtility(context).height * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MyUtility(context).height * 0.06,
                    ),
                    SizedBox(
                      width: 400,
                      child: Stack(
                        alignment:
                            Alignment.topCenter, // Center align the stack
                        children: [
                          // Row containing the text
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Download ",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontFamily: 'ralewaysemi',
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "watif",
                                style: TextStyle(
                                  fontSize: 48,
                                  fontFamily: 'comfortaaMedium',
                                  color: Color.fromRGBO(207, 211, 0, 1),
                                ),
                              ),
                            ],
                          ),

                          Positioned(
                            top: 0,
                            right: 5,
                            child: SvgPicture.asset(
                              'images/tmw.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "for mahala, free, verniet...",
                      style: TextStyle(
                          fontSize: 38,
                          fontFamily: 'ralewaysemi',
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.01,
                    ),
                    const Text.rich(TextSpan(
                      children: [
                        TextSpan(
                          text:
                              'Hit the road with confidence and ditch the stress! ',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.white),
                        ),
                        TextSpan(
                          text: 'watif ',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'comfortaaMedium',
                              color: Colors.white),
                        ),
                        TextSpan(
                          text:
                              "is\nyour free, all-in-one automotive app that empowers you with\neverything you need.",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'raleway',
                              color: Colors.white),
                        )
                      ],
                    )),
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
                      height: MyUtility(context).height * 0.01,
                    ),
                    /* AiCoDriverButton(
                        image: 'images/WindowsStore.png', onpress: () {}),*/
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    WatifContactUs(
                        buttonText: 'Contact Us',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Material(
                                        child: Page7(),
                                      )));
                        }),
                    SizedBox(
                      height: MyUtility(context).height * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MyUtility(context).width * 0.1,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/stars.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22.5,
                          child: SvgPicture.asset(
                            'images/profileicon.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          )
        ],
      ),
    );
  }
}
