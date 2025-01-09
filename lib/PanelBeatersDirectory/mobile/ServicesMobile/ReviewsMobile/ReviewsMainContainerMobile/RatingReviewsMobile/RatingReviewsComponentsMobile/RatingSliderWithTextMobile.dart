import 'package:flutter/material.dart';

import 'RatingSliderMobile.dart';


class RatingSliderWithTextMobile extends StatelessWidget {
  final int currentState;

  const RatingSliderWithTextMobile({Key? key, required this.currentState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335 - .04,
      child: Row(
        children: [
          Text(
            currentState.toString(),
            style: TextStyle(
              color: Colors.white.withOpacity(0.699999988079071),
              fontSize: 9.66,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              letterSpacing: 0.17,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          SizedBox(
              width: 320,
              child: RatingSliderMobile(currentState: currentState)),
        ],
      ),
    );
  }
}
