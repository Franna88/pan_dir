import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';

import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/ArticlesMobileWhite.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/ArticlesSearchbarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/articleDescriptionContainer.dart';
import 'package:webdirectories/myutility.dart';

import '../MobileTopNavBar/MobileTopNavBarhome.dart';
import 'RecentArticlesPageMobile/RecentArticlesPageMobile.dart';

class MobileRecentArticles extends StatefulWidget {
  const MobileRecentArticles({super.key});

  @override
  State<MobileRecentArticles> createState() => _MobileRecentArticlesState();
}

class _MobileRecentArticlesState extends State<MobileRecentArticles> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthDevice,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mobileLanding.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MobileTopNavBarhome(),
                    Text(
                      'Recent Articles:',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'ralewaybold',
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: ArticlesSearchbarMobile(),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        width: MyUtility(context).width * 0.87,
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
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ArticleDescriptionContainer(
                                image: 'images/nightdrive1.png',
                                category: 'Panel Beater Directory',
                                headline:
                                    'See your Lightstone EchoMBR Results for February 2024',
                                writer: 'By Wena Cronje',
                                description:
                                    'Your CSI success contributes to your business success and assists both prospects and industry users.',
                                onpress: () {
                                  Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const RecentArticlesPageMobile()),
                                                );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: ShapeDecoration(
                                        shape: CircleBorder(
                                          side: BorderSide(
                                            width: 0.94,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 4,
                                      top: 5,
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.black,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: EdgeInsets.zero,
                                  child: Icon(
                                    Icons.keyboard_arrow_right_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Articlesmobilewhite(
                                category: 'Panel Beater Directory',
                                headline: 'The Lightstone EchoMBR Ranking Awards',
                                writer: 'By Wena Cronje',
                                description:
                                    'Congratulations to the winners and top performers in each of the categories!',
                                onpress: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Articlesmobilewhite(
                                category: 'Panel Beater Directory',
                                headline: 'What do different car colours mean?',
                                writer: 'By Wena Cronje',
                                description:
                                    'Dive into the fascinating world of car colour psychology and discover what your ride reveals about...',
                                onpress: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Articlesmobilewhite(
                                category: 'Panel Beater Directory',
                                headline:
                                    'The Future of Panel Beating in South Africa',
                                writer: 'By Wena Cronje',
                                description:
                                    'The panelbeating industry is constantly evolving, as new technologies and material...',
                                onpress: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PanFooterMobile()
          ],
        ),
      ),
    );
  }
}
