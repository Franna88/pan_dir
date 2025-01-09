import 'package:flutter/material.dart';

class RatingSlider extends StatelessWidget {
  final int currentState;
  final double? amount;
  const RatingSlider({Key? key, required this.currentState, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: LinearProgressIndicator(
            value: amount ??
                currentState / 5, // Assuming currentState ranges from 0 to 5
            backgroundColor: Colors.white.withOpacity(0.09000000357627869),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 8.66, // Adjust the height of the progress bar
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              6,
              (index) {
                Color color;
                if (index <
                    (amount != null ? amount! * 6 : currentState).ceil()) {
                  // Color for completed states
                  color = Color(0xFFFFB400);
                } else {
                  // Color for pending states
                  color = Colors.white.withOpacity(0.09000000357627869);
                }
                return Expanded(
                  child: Container(
                    color: color,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
