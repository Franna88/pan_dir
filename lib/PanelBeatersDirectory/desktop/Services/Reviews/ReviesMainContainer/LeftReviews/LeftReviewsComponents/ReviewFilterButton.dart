import 'package:flutter/material.dart';

class ReviewFilterButton extends StatefulWidget {
  final String filterType;
  final VoidCallback onPressed;

  const ReviewFilterButton({
    Key? key,
    required this.filterType,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ReviewFilterButton> createState() => _ReviewFilterButtonState();
}

class _ReviewFilterButtonState extends State<ReviewFilterButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 8), // Adjust padding
          backgroundColor: Color(0xFF0E1013),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.08),
          ),
        ),
        child: Text(
          widget.filterType,
          style: TextStyle(
            color: Colors.white,
            fontSize: 9.51,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
