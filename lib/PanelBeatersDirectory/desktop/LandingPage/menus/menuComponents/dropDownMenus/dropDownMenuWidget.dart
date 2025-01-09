import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final String topText;
  const DropDownMenuWidget(
      {super.key,
      required this.topText,
      required this.widget1,
      required this.widget2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topText,
            style: const TextStyle(
              color: Color.fromARGB(255, 206, 205, 205),
              fontSize: 16,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          widget1,
          const SizedBox(
            height: 15,
          ),
          widget2,
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
