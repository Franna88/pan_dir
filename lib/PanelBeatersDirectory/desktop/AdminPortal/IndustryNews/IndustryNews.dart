import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/NewsUiContainers/IndustryArticles.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/NewsUiContainers/IndustrySmall.dart';
import 'package:webdirectories/myutility.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Dashboard/DashboardContainers/DashProfileView.dart';
import 'NewsUiContainers/AriclesAlt.dart';

class IndustryNews extends StatefulWidget {
  const IndustryNews({super.key});

  @override
  State<IndustryNews> createState() => _IndustryNewsState();
}

class _IndustryNewsState extends State<IndustryNews> {
  final ScrollController _scrollController = ScrollController();

  void _openLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // Launch the URL
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: const BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width * 0.8,
              height: MyUtility(context).height * 0.85,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.57, -0.82),
                  end: const Alignment(-0.57, 0.82),
                  colors: [
                    const Color(0x19777777),
                    Colors.white.withOpacity(0.4),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0xBF000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DraggableScrollbar.rrect(
                  controller: _scrollController,
                  backgroundColor: const Color(0x7F9E9E9F),
                  alwaysVisibleScrollThumb: true,
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'See the Latest Industry News',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.60,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Discover the ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.73,
                                          fontFamily: 'raleway',
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            'latest industry developments and insights',
                                        style: TextStyle(
                                          color: Color(0xFFEF9040),
                                          fontSize: 16.73,
                                          fontFamily: 'ralewaysemi',
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ' directly from our owners portal',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.73,
                                          fontFamily: 'raleway',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Our Newest Article:',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.60,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.02,
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.64,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ArticlesAlt(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IndustryArticles(
                                  imagePath: 'images/ARM.png',
                                  onPressed: () {
                                    _openLink(
                                        'https://autoref.co.za/'); // Link you want to open
                                  },
                                ),
                                IndustryArticles(
                                  imagePath: 'images/abr.png',
                                  onPressed: () {
                                    _openLink(
                                        'https://www.abrbuzz.co.za/'); // Link you want to open
                                  },
                                  alignLeft: true,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IndustrySmall(
                            image: 'images/AutoTrader.png',
                            heading: 'Autotrader',
                            article:
                                'AutoTrader South Africa is a leading online platform for buying and selling new and used vehicles in South Africa. It provides a comprehensive marketplace for car buyers and sellers, offering a wide range of listings, search tools, and additional services. AutoTrader also features automotive news, reviews, and advice, making it a valuable resource for anyone interested in the South African automotive market.',
                            link: () {
                              _openLink(
                                  'https://www.autotrader.co.za/'); // Link you want to open
                            },
                          ),
                          IndustrySmall(
                            image: 'images/carmag.png',
                            heading: 'CAR Magazine',
                            article:
                                'CAR Magazine is a leading automotive publication in South Africa. Since 1957, it has been at the forefront of providing expert opinions on all things motoring. Known for its in-depth reviews, road tests, and industry news, CAR Magazine offers valuable information for both car enthusiasts and potential buyers. Their commitment to authority and credibility has made them a trusted source in the South African automotive market.',
                            link: () {
                              _openLink(
                                  'https://www.carmag.co.za/'); // Link you want to open
                            },
                          ),
                          IndustrySmall(
                            image: 'images/rmi.png',
                            heading: 'Retail Motor Industry Organization',
                            article:
                                'RMI is a leading trade association representing the interests of the automotive retail industry in South Africa. It provides support, services, and advocacy for its members, which include car dealerships, vehicle repair workshops, and other related businesses. RMI plays a crucial role in promoting the growth and development of the automotive retail sector, while also ensuring that its members adhere to industry standards and ethical practices.',
                            link: () {
                              _openLink(
                                  'https://www.rmi.org.za/'); // Link you want to open
                            },
                          ),
                          IndustrySmall(
                            image: 'images/CRA.png',
                            heading:
                                'Collision Repairers Association of South Africa',
                            article:
                                "The CRA is committed to maintaining and promoting a high standard of service among its members, ensuring that customers receive top-notch repairs. By adhering to global best practices, CRA helps to minimize the risks associated with future collisions caused by poor workmanship. Whether you're a consumer looking for a trustworthy repair shop or a professional in the industry, CRA offers a valuable network and resources.",
                            link: () {
                              _openLink(
                                  'https://crasa.org.za/'); // Link you want to open
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
