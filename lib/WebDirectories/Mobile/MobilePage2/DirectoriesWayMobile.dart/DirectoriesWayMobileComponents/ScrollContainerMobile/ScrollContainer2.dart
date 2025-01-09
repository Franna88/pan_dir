import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ScrollContainer2 extends StatefulWidget {
  const ScrollContainer2({super.key});

  @override
  State<ScrollContainer2> createState() => _ScrollContainer2State();
}

class _ScrollContainer2State extends State<ScrollContainer2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      height: MyUtility(context).height / 2.2,
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
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "At Web Directories ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "we challenge the status quo of web information organization ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "and access by innovating gateways to web data, eliminating user frustration by ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "digitizing the “middlemen”. ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "We convert relevant industry information into ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "usable intelligence, ",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      "harnessing the web’s power to provide access to library sources.",
                  style: TextStyle(
                    fontSize: 19,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "user-centered experiences ",
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
