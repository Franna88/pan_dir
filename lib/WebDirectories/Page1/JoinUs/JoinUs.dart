import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page1/AiCoDriver/AiCoDriver.dart';
import 'package:webdirectories/WebDirectories/Page1/Comments/Comments.dart';
import 'package:webdirectories/WebDirectories/Footer/Footer.dart';
import 'package:webdirectories/WebDirectories/Page1/JoinUs/JoinUsComponents/JoinUsContainer.dart';
import 'package:webdirectories/myutility.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.04,
            ),
            Text(
              "Want to join us?",
              style: TextStyle(
                  fontSize: 48, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
            /*Text.rich(
              TextSpan(
                text: 'Follow these ',
                style: TextStyle(
                  fontSize: 26.5,
                  fontFamily: 'ralewaysemi',
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: '4',
                    style: TextStyle(
                        fontSize: 24.5,
                        fontFamily: '',
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: ' easy steps',
                    style: TextStyle(
                      fontSize: 26.5,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                JoinUsContainer(
                    icon: 'images/cursor.svg',
                    header: 'Visit',
                    paragraph:
                        "Navigate to the official directory website you want to join."),
                JoinUsContainer(
                    icon: 'images/profile.svg',
                    header: 'Get Listed',
                    paragraph:
                        "Click on “Get Listed Today” in the menu and follow our easy online registration process."),
                JoinUsContainer(
                    icon: 'images/letter.svg',
                    header: 'Receive',
                    paragraph:
                        "Receive email confirmation of membership and Owners Portal login detail."),
                JoinUsContainer(
                    icon: 'images/arrowbox.svg',
                    header: 'Update',
                    paragraph:
                        "Log into your Owners Portal to review, update & manage all your business information in real-time."),
              ],
            ),*/
            Container(
              width: MyUtility(context).width,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                child: Container(
                  width: MyUtility(context).width * 0.9,
                  height: MyUtility(context).height * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/JoinUsDesk.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
