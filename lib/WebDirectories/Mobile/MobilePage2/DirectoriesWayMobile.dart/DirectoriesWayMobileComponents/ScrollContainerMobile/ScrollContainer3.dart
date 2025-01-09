import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ScrollContainer3 extends StatefulWidget {
  const ScrollContainer3({super.key});

  @override
  State<ScrollContainer3> createState() => _ScrollContainer3State();
}

class _ScrollContainer3State extends State<ScrollContainer3> {
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "We focus on enhancing ",
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
              TextSpan(
                text: "that efficiently access entire economic markets, ",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'raleway',
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "lowering barriers to SME’s online presence.",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'ralewaysemi',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text:
                    "\n\nWe are technology builders that continuously design, develop, and evaluate our data-driven services.",
                style: TextStyle(
                  fontSize: 19,
                  fontFamily: 'raleway',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
