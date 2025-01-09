import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/AriclesSmallImageContainer.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/mobileDummyArticle.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/dummyArticle.dart';
import 'package:webdirectories/myutility.dart';

class StackedArticleMobile extends StatefulWidget {
  const StackedArticleMobile({super.key});

  @override
  State<StackedArticleMobile> createState() => _StackedArticleMobileState();
}

class _StackedArticleMobileState extends State<StackedArticleMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ArticlesSmallImageContainer(
            catagory: 'Fuel Directory',
            headline: "What Would Happen If You Put Jet Fuel in Your Car?",
            writer: 'Wena Cronje',
            discription:
                "Will jet fuel provide a performance boost or lead to disastrous results?",
            onpress: () {
              
            }),
        ArticlesSmallImageContainer(
            catagory: 'Towing Directory',
            headline: "Why Compare Car Insurance quotes?",
            writer: 'Wena Cronje',
            discription:
                "Let us explore how you could save big on your premiums.",
            onpress: () {}),
        ArticlesSmallImageContainer(
            catagory: 'Web Directories',
            headline: "How to Create a Killer Web Directories Listing",
            writer: 'Wena Cronje',
            discription:
                "Today, we'll share 7 tips to drive your online presence and revenue to new heights.",
            onpress: () {}),
        SizedBox(
          height: 45,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF0E1013), // Setting the background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              'Read more articles',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'raleway', color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.1,
            ),
          ],
        ),
      ],
    );
  }
}
