import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page1/Comments/CommentsComponents/CommentsContainer.dart';
import 'package:webdirectories/myutility.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final PageController _pageController = PageController();
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            width: MyUtility(context).width / 1.2,
            height: MyUtility(context).height * 0.35,
            child: PageView(
              controller: _pageController,
              children: const [
                CommentsContainer(
                  profileimage: 'images/pfp.png',
                  comment:
                      "“ I've been taking my car to the same panel beater for years, and I've always been happy with their service. Johan and his team is always honest and upfront about the cost, and they do a great job. I highly recommend the Panel Beater Directory to anyone looking to find a reliable auto body repairer. “",
                  username: 'Stefan Joubert',
                ),
                CommentsContainer(
                  profileimage: 'images/avatar5.png',
                  comment:
                      "“I have a long commute to work and I’m always on a tight budget. But then I found the Fuel Directory and it’s really a lifesaver! I can now find the best deals on petrol in Centurion with just a few clicks. It’s so easy to use and it saves me a ton of money. I’m grateful, thanks!”",
                  username: 'Lisa Gumede',
                ),
                CommentsContainer(
                  profileimage: 'images/pfp3.png',
                  comment:
                      "“ I was in a car accident and my car was completely totaled. i had no idea how I was going to get it towed and what to do next. A quick Google search led me to your Towing Directory. The tow truck driver I contacted was very understanding and helpful. He towed my car to a nearby garage and even helped me to file a claim from my insurance company. I was so impressed with the service I received, and I’m really glad I found them on your website! Thanks. “",
                  username: 'Chris Stevens',
                ),
              ],
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 1;
                  });
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: SvgPicture.asset(
                  index == 0 ? 'images/leftArrow.svg' : 'images/arrowr.svg',
                  width: 30,
                  height: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                  });
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                icon: SvgPicture.asset(
                  index == 1 ? 'images/arrowc.svg' : 'images/rightArrow.svg',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          ),
        ],
      ),
    );
  }
}
