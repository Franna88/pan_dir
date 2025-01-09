import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/FooterMobile/PanFooterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/AriclesCommentContainerMobile/ArticlesCommentContainerMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/ArticlesPostaCommentMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/ArticlesShareMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/ArticlesTextMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/AuthorMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/RecentArticlesPageMobile/RecentArticlesPageComp.dart/SeoTagsArticle.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobileTopNavBar/MobileTopNavBar.dart';

import 'package:webdirectories/myutility.dart';

class MobileDummyArticle extends StatefulWidget {
  const MobileDummyArticle({Key? key}) : super(key: key);

  @override
  State<MobileDummyArticle> createState() =>
      _MobileDummyArticleState();
}

class _MobileDummyArticleState extends State<MobileDummyArticle> {
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: MyUtility(context).height,
              width: MyUtility(context).width,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MobileTopNavBar(),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: [
                          
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 0, top: 10),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    width: MyUtility(context).width * 0.9,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.white,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height:
                                                MyUtility(context).height *
                                                    0.03,
                                          ),
                                          Container(
                                            width:
                                                MyUtility(context).width *
                                                    0.85,
                                            height: 200,
                                            decoration: ShapeDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "images/drive2.png"),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        19.76),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          SizedBox(
                                            width:
                                                MyUtility(context).width *
                                                    0.8,
                                            child: Text(
                                              'See your Lightstone EchoMBR Results for February 2024',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: widthDevice < 400
                                                    ? 24
                                                    : 27.2,
                                                fontFamily: 'ralewaybold',
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: AuthorMobile(otherDirectoryTextColor: Color.fromRGBO(67, 126, 164, 1) ,),
                                          ),
                                          Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Your CSI success contributes to your business success and assists\nboth prospects and industry users.',
                                                  style: TextStyle(
                                                    color:
                                                        Color.fromRGBO(67, 126, 164, 1),
                                                    fontSize: 14,
                                                    fontStyle:
                                                        FontStyle.italic,
                                                    fontFamily:
                                                        'ralewaymedium',
                                                  ),
                                                ),
                                                ArticlesTextMobile(
                                                  headline:
                                                      'Your Ultimate Business Tool',
                                                  paragraphText:
                                                      'Your CSI success contributes to your business success and assists both prospects and industry users. Your updated Lightstone EchoMBR KAI results are now available in your online Panelbeaters Directory Profile* and your Owners Portal. * Results are public-facing for Featured Members only, you have the option to switch it off in the Owners Portal ',
                                                ),
                                                ArticlesTextMobile(
                                                    headline:
                                                        'Who is Lightstone?',
                                                    paragraphText:
                                                        'Lightstone helps clients deliver and optimize multi-channel customer engagements by enabling them to interact with customers in a variety of ways. One of its key features, EchoMBR, helps businesses identify and immediately follow up with unhappy customers to ensure that customer satisfaction is a top priority. The system is designed to not only measure customer satisfaction levels but also to actively encourage motor body repairers to take action to address customer concerns. This process of continuous improvement leads to increasingly higher levels of customer satisfaction.'),
                                                Center(
                                                  child: Container(
                                                    width: 204,
                                                    height: 204,
                                                    decoration:
                                                        BoxDecoration(
                                                            color: Color(
                                                                0xFFD9D9D9)),
                                                  ),
                                                ),
                                                ArticlesTextMobile(
                                                    headline:
                                                        'How are results calculated?',
                                                    paragraphText:
                                                        'Lightstone EchoMBR Rankings are based on actual customer feedback from approximately 460,000 customers. Using advanced Bayesian statistical methods and multi-level models, Lightstone identifies the MBRs that consistently score high with their customers according to Key Attribute Index (KAI) categories (See explanation below). As a result, consumers can trust that the top-ranked MBRs are the best in the business.'),
                                                ArticlesTextMobile(
                                                    headline:
                                                        'Not a Featured member yet?',
                                                    paragraphText:
                                                        'The motoring public is online, +70% find and appoint service providers themselves. You already spend a lot of R on achieving your KAI Quality status but does the motoring public know about it? The solution: Instant online registration Google your profile - Chances are that your BASIC profile is already on top page 1. Gain access to the Owners Portal where you can update all your business Info for maximum results Including your Lightstone EchoMBR results'),
                                                Center(
                                                  child: Container(
                                                    width: 204,
                                                    height: 204,
                                                    decoration:
                                                        BoxDecoration(
                                                            color: Color(
                                                                0xFFD9D9D9)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15,
                                                          bottom: 10),
                                                  child: Center(
                                                      child:
                                                          ArticlesShareMobile()),
                                                ),
                                                SeoTagsArticleMobile(),
                                                ArticlesPostCommentMobile(
                                                  whiteText: true,
                                                  otherDirectoryButtonColor: Color.fromRGBO(67, 126, 164, 1),
                                                  otherDirectoryTextColor: Color.fromRGBO(67, 126, 164, 1),
                                                ),
                                                ArticlesCommentContainerMobile()
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FooterMobile()
          ],
        ),
      ),
    );
  }
}
