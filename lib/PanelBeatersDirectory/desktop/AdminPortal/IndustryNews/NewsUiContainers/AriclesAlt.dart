import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/IndustryComp/IndustryButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/IndustryComp/IndustySeoTags.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesAlt extends StatefulWidget {
  const ArticlesAlt({super.key});

  @override
  State<ArticlesAlt> createState() => _ArticlesAltState();
}

class _ArticlesAltState extends State<ArticlesAlt> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.27,
      height: MyUtility(context).height * 0.64,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.49),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 29.67,
            offset: Offset(0, 14.84),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            height: MyUtility(context).height * 0.3,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/drive.png',
                ),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MyUtility(context).height * 0.01,
                ),
                Text(
                  'Panel Beater Directory',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: 16.1236,
                    fontFamily: 'ralewaybold',
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.005,
                ),
                Text(
                  'See your Lightstone EchoMBR Results for February 2024',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.2848,
                    fontFamily: 'ralewaysemi',
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.005,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By',
                        style: TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 16.1236,
                          fontFamily: 'ralewaybold',
                        ),
                      ),
                      TextSpan(
                        text: ' Wena Cronje',
                        style: TextStyle(
                          color: Color(0xFF606060),
                          fontSize: 16.1236,
                          fontFamily: 'ralewaymedium',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.005,
                ),
                Text(
                  'Your CSI success contributes to your business success and assists both prospects and industry users.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0688,
                    fontFamily: 'raleway',
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IndustySeoTags(
                      seoTags: 'Lightstone',
                    ),
                    IndustySeoTags(
                      seoTags: 'EchoMBR',
                    ),
                    IndustySeoTags(
                      seoTags: 'KAI Results',
                    ),
                    IndustySeoTags(
                      seoTags: 'Panelbeaters',
                    ),
                    IndustryButton(),
                    SizedBox(
                      width: MyUtility(context).width * 0.005,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
