import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const PopUpTextField(
      {super.key, required this.text, required this.controller});

  @override
  State<PopUpTextField> createState() => _PopUpTextFieldState();
}

class _PopUpTextFieldState extends State<PopUpTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.61,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: MyUtility(context).width * 0.25,
          height: MyUtility(context).height * 0.045,
          child: TextFormField(
            controller: widget.controller,
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
