import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ReviewFilterButtonMobile extends StatefulWidget {
  final String filterType;
  final VoidCallback onPressed;

  const ReviewFilterButtonMobile({
    Key? key,
    required this.filterType,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ReviewFilterButtonMobile> createState() =>
      _ReviewFilterButtonMobileState();
}

class _ReviewFilterButtonMobileState extends State<ReviewFilterButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
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
            fontSize: MyUtility(context).width * 0.021,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
