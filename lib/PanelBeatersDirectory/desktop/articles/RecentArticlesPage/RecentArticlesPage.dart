import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/AriclesCommentContainer/ArticlesCommentContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/ArticlesPostaComment.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/ArticlesShare.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/ArticlesText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/Author.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/SeoTagsArticle.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/ArticlesContainer.dart';
import 'package:webdirectories/myutility.dart';

class RecentArticlesPage extends StatefulWidget {
  const RecentArticlesPage({Key? key}) : super(key: key);

  @override
  State<RecentArticlesPage> createState() => _RecentArticlesPageState();
}

class _RecentArticlesPageState extends State<RecentArticlesPage> {
  final search = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: MyUtility(context).height,
              width: MyUtility(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'images/mainbackgroundPanel.png'), // Check the path
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  right: 75,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25, top: 25),
                      child: SizedBox(
                        width: MyUtility(context).width / 1.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Image.asset(
                                'images/panelLogo.png', // Check the path
                                // height: 70,
                                width: MyUtility(context).width * 0.23,
                              ),
                            ),
                            Text(
                              'Recent Articles:',
                              style: TextStyle(
                                fontSize: 34,
                                fontFamily: 'ralewaybold',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MyUtility(context).width / 1.12,
                      height: MyUtility(context).height * 0.83,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.56, -0.83),
                          end: Alignment(-0.56, 0.83),
                          colors: [
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.4)
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
                          Container(
                            width: MyUtility(context).width / 1.1,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFF0E1013),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 0.5,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.keyboard_arrow_left,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'Go Back',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.68,
                                            fontFamily: 'raleway',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, top: 10),
                              child: DraggableScrollbar.rrect(
                                controller: _scrollController,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                                alwaysVisibleScrollThumb: true,
                                child: ListView(
                                  controller: _scrollController,
                                  children: [
                                    Center(
                                      child: Container(
                                        width: MyUtility(context).width * 0.85,
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
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                                  MyUtility(context).height *
                                                      0.03,
                                            ),
                                            Container(
                                              width: MyUtility(context).width *
                                                  0.8,
                                              height: 400,
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
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: widthDevice < 1500
                                                        ? 20
                                                        : widthDevice * 0.08),
                                                child: Text(
                                                  'See your Lightstone EchoMBR Results for\nFebruary 2024',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 34,
                                                    fontFamily: 'ralewaybold',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Author(),
                                                  SizedBox(
                                                    width: 350,
                                                  ),
                                                  ArticlesShare()
                                                ],
                                              ),
                                            ),
                                            Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 3,
                                                            height: 87,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Color(
                                                                        0xFFD9D9D9)),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Text(
                                                            'Your CSI success contributes to your business success and assists\nboth prospects and industry users.',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFE5882F),
                                                              fontSize: 20.4,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                              fontFamily:
                                                                  'ralewaymedium',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      ArticlesText(
                                                        headline:
                                                            'Your Ultimate Business Tool',
                                                        paragraphText:
                                                            'Your CSI success contributes to your business success and assists both prospects and industry users. Your updated Lightstone EchoMBR KAI results are now available in your online Panelbeaters Directory Profile* and your Owners Portal. * Results are public-facing for Featured Members only, you have the option to switch it off in the Owners Portal ',
                                                      ),
                                                      ArticlesText(
                                                          headline:
                                                              'Who is Lightstone?',
                                                          paragraphText:
                                                              'Lightstone helps clients deliver and optimize multi-channel customer engagements by enabling them to interact with customers in a variety of ways. One of its key features, EchoMBR, helps businesses identify and immediately follow up with unhappy customers to ensure that customer satisfaction is a top priority. The system is designed to not only measure customer satisfaction levels but also to actively encourage motor body repairers to take action to address customer concerns. This process of continuous improvement leads to increasingly higher levels of customer satisfaction.'),
                                                      ArticlesText(
                                                          headline:
                                                              'How are results calculated?',
                                                          paragraphText:
                                                              'Lightstone EchoMBR Rankings are based on actual customer feedback from approximately 460,000 customers. Using advanced Bayesian statistical methods and multi-level models, Lightstone identifies the MBRs that consistently score high with their customers according to Key Attribute Index (KAI) categories (See explanation below). As a result, consumers can trust that the top-ranked MBRs are the best in the business.'),
                                                      ArticlesText(
                                                          headline:
                                                              'Not a Featured member yet?',
                                                          paragraphText:
                                                              'The motoring public is online, +70% find and appoint service providers themselves. You already spend a lot of R on achieving your KAI Quality status but does the motoring public know about it? The solution: Instant online registration Google your profile - Chances are that your BASIC profile is already on top page 1. Gain access to the Owners Portal where you can update all your business Info for maximum results Including your Lightstone EchoMBR results'),
                                                      SeoTagsArticle(),
                                                      ArticlesPostComment(),
                                                      ArticlesCommentContainer()
                                                    ],
                                                  ),
                                                  SizedBox(width: 20),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 204,
                                                        height: 408,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xFFD9D9D9)),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            MyUtility(context)
                                                                    .height *
                                                                0.05,
                                                      ),
                                                      Container(
                                                        width: 204,
                                                        height: 204,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xFFD9D9D9)),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            MyUtility(context)
                                                                    .height *
                                                                0.05,
                                                      ),
                                                      Container(
                                                        width: 204,
                                                        height: 408,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xFFD9D9D9)),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            MyUtility(context)
                                                                    .height *
                                                                0.05,
                                                      ),
                                                      Container(
                                                        width: 204,
                                                        height: 204,
                                                        decoration:
                                                            BoxDecoration(
                                                                color: Color(
                                                                    0xFFD9D9D9)),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
