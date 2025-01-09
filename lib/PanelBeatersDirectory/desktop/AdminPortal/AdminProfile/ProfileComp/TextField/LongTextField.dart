import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class LongTextField extends StatefulWidget {
  final TextEditingController controller;
  final String headline;
  final double? width; // Optional width parameter

  const LongTextField({
    Key? key,
    required this.controller,
    required this.headline,
    this.width, // Include the optional parameter
  }) : super(key: key);

  @override
  State<LongTextField> createState() => _LongTextFieldState();
}

class _LongTextFieldState extends State<LongTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headline,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: widget.width ??
                MyUtility(context).width *
                    0.497, // Use the provided width or default to the specified value
            height: MyUtility(context).height * 0.13,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: TextStyle(
                    fontSize: 14.7364,
                    fontFamily: 'raleway',
                    color: Color(0xFF5F6368),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
