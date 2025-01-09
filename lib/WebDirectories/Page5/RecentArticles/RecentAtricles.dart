import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/RecentArticlesComponents/ArticleContainer.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/dummyArticle.dart';
import 'package:webdirectories/myutility.dart';

class RecentArticles extends StatefulWidget {
  const RecentArticles({super.key});

  @override
  State<RecentArticles> createState() => _RecentArticlesState();
}

class _RecentArticlesState extends State<RecentArticles> {
  final email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MyUtility(context).height * 1.6,
        width: MyUtility(context).width / 1.2,
        child: Column(
          children: [
            SizedBox(
              width: MyUtility(context).width / 1.25,
              height: MyUtility(context).height * 0.15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      "Recent articles",
                      style: TextStyle(
                        fontSize: 42,
                        fontFamily: 'ralewaysemi',
                      ),
                    ),
                  ),
                  Container(
                    width: MyUtility(context).width * 0.2,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: email,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Search Keywords',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'ralewaysemi',
                                color: Color(0xFF717375),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.transparent,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            email.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArticlesContainer(
                    image: 'images/drive.png',
                    category: 'Panel Beater Directory',
                    headline:
                        "See your Lightstone EchoMBR Results for February 2024",
                    writer: 'Wena Cronje',
                    description:
                        "Your CSI success contributes to your business success and assists both prospects and industry users.",
                    onpress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DummyAtricle()),
                      );
                    }),
                ArticlesContainer(
                    image: 'images/turbine.png',
                    category: 'Fuel Directory',
                    headline:
                        "What Would Happen If You Put Jet Fuel in Your Car?",
                    writer: 'Wena Cronje',
                    description:
                        "Will jet fuel provide a performance boost or lead to disastrous results?",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/drive1.png',
                    category: 'Towing Directory',
                    headline: "Why Compare Car Insurance quotes?",
                    writer: 'Wena Cronje',
                    description:
                        "Let us explore how you could save big on your premiums.",
                    onpress: () {}),
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ArticlesContainer(
                    image: 'images/buisness.png',
                    category: 'Web Directories',
                    headline: "How to Create a Killer Web Directories Listing",
                    writer: 'Wena Cronje',
                    description:
                        "Today, we'll share 7 tips to drive your online presence and revenue to new heights.",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/confrance.png',
                    category: 'Web Directories',
                    headline: "Is Hybrid Work spaces the Future?",
                    writer: 'Wena Cronje',
                    description:
                        "Let’s explore hybrid working models that combines home and office work.",
                    onpress: () {}),
                ArticlesContainer(
                    image: 'images/crime.png',
                    category: 'Auto Repair Directory',
                    headline:
                        "Hijacking and Carjacking: What to do in such events",
                    writer: 'Wena Cronje',
                    description:
                        "Hijacking in South Africa is one of those scary facts we do not like to think about. Prevention is better than cure.",
                    onpress: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
