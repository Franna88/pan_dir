import 'package:flutter/material.dart';

class GreyButton extends StatelessWidget {
  String buttonText;
  GreyButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          /*width: MediaQuery.of(context).size.width * 0.08,*/
          /*height: MediaQuery.of(context).size.height * 0.05,*/
          child: ElevatedButton(
            onPressed: () {},
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
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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
