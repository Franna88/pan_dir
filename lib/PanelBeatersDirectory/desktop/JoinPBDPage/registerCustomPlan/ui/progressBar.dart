import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  Widget orangeBar;
  ProgressBar({super.key, required this.orangeBar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Stack(
        children: [
          Container(
            width: 520,
            height: 12,
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
    );
  }
}