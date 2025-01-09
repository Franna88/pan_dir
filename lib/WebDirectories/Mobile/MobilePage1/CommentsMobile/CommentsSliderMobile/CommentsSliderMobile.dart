import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage1/CommentsMobile/CommentsMobile.dart';
import 'package:webdirectories/myutility.dart';

class CommentsSliderMobile extends StatefulWidget {
  const CommentsSliderMobile({super.key});

  @override
  State<CommentsSliderMobile> createState() => _CommentsSliderMobileState();
}

class _CommentsSliderMobileState extends State<CommentsSliderMobile> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                CommentsMobile(
                    profileImage: 'images/pfp.png',
                    comment:
                        "“I've been taking my car to the same panel beater for years, and I've always been happy with their service. Johan and his team is always honest and upfront about the cost, and they do a great job. I highly recommend the Panel Beater Directory to anyone looking to find a reliable auto body repairer.”",
                    username: 'Stefan Joubert'),
                CommentsMobile(
                    profileImage: 'images/avatar5.png',
                    comment:
                        "“I have a long commute to work and I’m always on a tight budget. But then I found the Fuel Directory and it’s really a lifesaver! I can now find the best deals on petrol in Centurion with just a few clicks. It’s so easy to use and it saves me a ton of money. I’m grateful, thanks!”",
                    username: 'Lisa Gumede'),
                CommentsMobile(
                    profileImage: 'images/pfp3.png',
                    comment:
                        "“ I was in a car accident and my car was completely totaled. i had no idea how I was going to get it towed and what to do next. A quick Google search led me to your Towing Directory. The tow truck driver I contacted was very understanding and helpful. He towed my car to a nearby garage and even helped me to file a claim from my insurance company. I was so impressed with the service I received, and I’m really glad I found them on your website! Thanks. “",
                    username: 'Chris Stevens'),
              ],
            ),
          ),
          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_pageController.hasClients) {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (_pageController.hasClients) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Additional spacing
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the PageController
    _pageController.dispose();
    super.dispose();
  }
}
