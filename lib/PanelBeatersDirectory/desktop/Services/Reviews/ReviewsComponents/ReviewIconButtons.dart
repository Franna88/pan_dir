import 'package:flutter/material.dart';

class ReviewIconButton extends StatefulWidget {
  final Function() onTapPrevious;
  final Function() onTapNext;

  const ReviewIconButton(
      {super.key, required this.onTapPrevious, required this.onTapNext});

  @override
  State<ReviewIconButton> createState() => _ReviewIconButtonState();
}

class _ReviewIconButtonState extends State<ReviewIconButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            widget.onTapPrevious();
          },
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
          onPressed: () {
            widget.onTapNext();
          },
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
