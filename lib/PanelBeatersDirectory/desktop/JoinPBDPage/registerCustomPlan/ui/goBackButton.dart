import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final VoidCallback onGoBack;
  GoBackButton({super.key, required this.onGoBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          /*width: MediaQuery.of(context).size.width * 0.08,*/
          /*height: MediaQuery.of(context).size.height * 0.05,*/
          child: ElevatedButton(
            onPressed: onGoBack,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Go Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'ralewaymedium',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
