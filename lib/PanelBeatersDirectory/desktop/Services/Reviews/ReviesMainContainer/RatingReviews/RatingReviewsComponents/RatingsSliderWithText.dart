import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviewsComponents/RatingSlider.dart';

class RatingSliderWithText extends StatelessWidget {
  final int currentState;
  final double? sliderAmount;

  const RatingSliderWithText(
      {Key? key, required this.currentState, this.sliderAmount})
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
              child: RatingSlider(
                amount: sliderAmount ?? currentState.toDouble(),
                currentState: currentState,
              )),
        ],
      ),
    );
  }
}
