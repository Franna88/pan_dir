import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;

  const CommonButton(
      {super.key, required this.buttonText, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 190,
        height: 36.72,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 26.5744,
              height: 26.5744,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8999999761581421),
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
