import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ResizzeableTextField extends StatefulWidget {
  final String text;
  final double textFieldWidth; // New parameter for width

  const ResizzeableTextField({
    Key? key,
    required this.text,
    this.textFieldWidth = 0.25, // Default width
  }) : super(key: key);

  @override
  State<ResizzeableTextField> createState() => _ResizzeableTextFieldState();
}

class _ResizzeableTextFieldState extends State<ResizzeableTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.32,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        SizedBox(
          width: MyUtility(context).width *
              widget.textFieldWidth, // Use custom width
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
