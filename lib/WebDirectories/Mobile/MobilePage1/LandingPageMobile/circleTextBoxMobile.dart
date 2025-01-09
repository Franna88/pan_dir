import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CircleTextboxMobile extends StatefulWidget {
  String Title1;
  String Title2;
  String description;
  int menuIndex;
  CircleTextboxMobile(
      {super.key,
      required this.Title1,
      required this.Title2,
      required this.description,
      required this.menuIndex});

  @override
  State<CircleTextboxMobile> createState() => _CircleTextboxMobileState();
}

class _CircleTextboxMobileState extends State<CircleTextboxMobile> {
  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Container(
      width: 325,
      //  height: MyUtility(context).height / 2,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "<  ",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  "${widget.menuIndex + 1} / 5 ",
                  style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                Text(
                  "  >",
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.Title1,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'ralewaybold',
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  widget.Title2,
                  style: TextStyle(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.description,
                  style: TextStyle(
                      fontSize: 17,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
