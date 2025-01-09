import 'package:flutter/material.dart';

class MobileDropDown extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final String topText;
  const MobileDropDown(
      {super.key,
      required this.topText,
      required this.widget1,
      required this.widget2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            topText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.64,
              fontFamily: 'raleway',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          widget1,
          const SizedBox(
            height: 10,
          ),
          widget2,
        ],
      ),
    );
  }
}
