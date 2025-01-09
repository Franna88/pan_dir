import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class OurStory extends StatefulWidget {
  const OurStory({Key? key}) : super(key: key);

  @override
  State<OurStory> createState() => _OurStoryState();
}

class _OurStoryState extends State<OurStory> {
  final PageController _pageController = PageController();
  var index = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            width: MyUtility(context).width / 1.2,
            height: MyUtility(context).height * 0.80,
            decoration: BoxDecoration(
              color: const Color(0xFF0E1013),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MyUtility(context).width / 3.5,
                  height: MyUtility(context).height * 0.80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MyUtility(context).height * 0.05),
                      const Text(
                        "A tale of passion, innovation and perseverance...",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'ralewaybold',
                          color: Color(0xFF65DAFF),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Our Story",
                          style: TextStyle(
                            fontSize: 42,
                            fontFamily: 'ralewaysemi',
                            color: Color(0xFFFBFBFB),
                          ),
                        ),
                      ),

                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          children: [
                            _buildPageContent(
                              context,
                              "In the early days of the internet, finding information online was a challenge. Search engines were still in their infancy, and websites were often hidden away on obscure servers. In 2013 a South African entrepreneur, passionate about the automotive industry and evolving technology, Thys Cronje, and his two sons, Christoff and Ryno, saw the opportunity to make the internet more accessible and user-friendly. With persistence, patience and one laptop, they founded Web Directories, an independent company that would create niche comprehensive directories for various industries across Southern Africa.",
                              "Web Directories first product, the Panel Beater Directory, was an immediate success and became an invaluable resource for businesses and individuals alike, helping them to find the information they needed quickly and easily. It also empowered those who want to conduct business with others who shared their values and provided a recognized platform for qualified independent repair shops to serve South African motorists.",
                            ),
                            // Add more pages as needed
                            _buildPageContent(
                              context,
                              "Over the years the Web Directories has grown to become one of the leading providers of various automotive directories in South Africa like the Towing Directory, Auto Repair Directory and Fuel Directory.",
                              "The company currently lists over 10 500 profiles receiving millions of profile visitors each month, and ambitious plans to further expand their reach into the African continent. Web Directories is a reputable company that is committed to helping businesses succeed online. We provide businesses with the right tools to reach the right target audience and all our profiles are localized, optimized, and safely backed by advanced data security measures. Our team is dedicated to growing the South African economy, one listing at a time! ",
                            ),
                            // More pages can be added here
                          ],
                        ),
                      ),
                      // Navigation buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  index = 0;
                                });
                                _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              icon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      index == 0 ? Colors.black : Colors.white,
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color:
                                      index == 0 ? Colors.white : Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  index = 1;
                                });
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                              icon: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      index == 1 ? Colors.black : Colors.white,
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color:
                                      index == 1 ? Colors.white : Colors.black,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MyUtility(context).height * 0.03,
                      )
                    ],
                  ),
                ),
                // Image container
                SizedBox(
                  width: MyUtility(context).width / 2.8,
                  height: MyUtility(context).height * 0.95,
                  child: Image.asset('images/laptop.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageContent(BuildContext context, String text1, String text2) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 3.5,
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 14.5,
              color: Color(0xFFFBFBFB),
              fontFamily: 'raleway',
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: MyUtility(context).height * 0.015),
        SizedBox(
          width: MyUtility(context).width / 3.5,
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 14.5,
              color: Color(0xFFFBFBFB),
              fontFamily: 'raleway',
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
