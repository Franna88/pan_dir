import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileProgressBar extends StatelessWidget {
  Widget orangeBar;
  MobileProgressBar({super.key, required this.orangeBar});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          children: [
            Container(
              //  width: widthDevice * 0.68,
              height: 5,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(72.36),
                ),
              ),
            ),
            orangeBar,
          ],
        ),
        Spacer(),
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.zero,
          child: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 14,
            ),
            onPressed: () {
              Navigator.pop(context); // Close the dialog when button is pressed
            },
          ),
        ),
      ],
    );
  }
}
