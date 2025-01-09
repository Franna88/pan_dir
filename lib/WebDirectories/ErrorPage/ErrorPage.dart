import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/myutility.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TopNavBar(),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '4',
              style: TextStyle(
                fontSize: 120,
                fontFamily: 'ralewayexbold',
                color: Colors.black,
              ),
            ),
            SvgPicture.asset(
              'images/error.svg',
              height: 82,
              width: 82,
            ),
            Text(
              '4',
              style: TextStyle(
                fontSize: 120,
                fontFamily: 'ralewayexbold',
                color: Colors.black,
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 48,
              fontFamily: 'raleway',
              color: Colors.black,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'ERROR ',
                style: TextStyle(fontFamily: 'ralewaybold'),
              ),
              TextSpan(
                text: 'Page Not Found',
              ),
            ],
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        SizedBox(
          width: MyUtility(context).width / 2.8,
          child: Text(
            "Sorry the page your are looking for might have been removed, had its name changed or doesn’t exist anymore!",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'raleway',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.04,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: MyUtility(context).width * 0.1,
            height: MyUtility(context).height * 0.05,
            decoration: BoxDecoration(
              color: Color(0xFF0E1013),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xFF0E1013),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'raleway',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
