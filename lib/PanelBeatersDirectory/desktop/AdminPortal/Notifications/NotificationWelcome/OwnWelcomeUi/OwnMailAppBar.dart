import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import '../WelcomeComponents/CommonColor.dart';

class OwnMailAppBar extends StatefulWidget {
  const OwnMailAppBar({super.key});

  @override
  State<OwnMailAppBar> createState() => _OwnMailAppBarState();
}

class _OwnMailAppBarState extends State<OwnMailAppBar> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        color: CommonColor().Colors4,
        height: 80,
        width: widthDevice,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: SizedBox(
                    height: MyUtility(context).height * 0.08,
                    child: Image.asset(
                      'images/newpandir.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Padding(padding: EdgeInsets.all(25.0)),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'About Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Web Directories',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
