import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class BiggerPopupTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  const BiggerPopupTextField(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<BiggerPopupTextField> createState() => _BiggerPopupTextFieldState();
}

class _BiggerPopupTextFieldState extends State<BiggerPopupTextField> {
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
        SizedBox(
          height: 8.0,
        ),
        Container(
          width: MyUtility(context).width * 0.25,
          height: MyUtility(context).height * 0.125,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: widget.controller,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
