import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ScrollContainer1 extends StatefulWidget {
  const ScrollContainer1({super.key});

  @override
  State<ScrollContainer1> createState() => _ScrollContainer1State();
}

class _ScrollContainer1State extends State<ScrollContainer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      height: MyUtility(context).height / 2.8,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: RichText(
            textAlign: TextAlign.center, // Align text to the center
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Our culture is built on ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "transparency, collaboration, and innovation, ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "where we ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "empower our team ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "to share ideas, take risks, and learn from each other. We believe that the best way to build a successful business is to create a culture where everyone feels ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "valued and respected, ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "and where everyone has the opportunity to contribute their ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "unique talents and perspectives.",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
