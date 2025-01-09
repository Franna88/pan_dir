import 'package:flutter/material.dart';

class ReviewIconButtonMobile extends StatefulWidget {
  final VoidCallback onPressLeft;
  final VoidCallback onPressRight;
  const ReviewIconButtonMobile(
      {super.key, required this.onPressLeft, required this.onPressRight});

  @override
  State<ReviewIconButtonMobile> createState() => _ReviewIconButtonMobileState();
}

class _ReviewIconButtonMobileState extends State<ReviewIconButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: widget.onPressLeft,
          icon: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: widget.onPressRight,
          icon: Container(
            padding: EdgeInsets.all(2),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0E1013)),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
