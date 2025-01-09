import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CustomTextFormField extends StatefulWidget {
  final String text;
  final TextEditingController controller;

  CustomTextFormField({Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'raleway',
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width * 0.19,
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDFDFDF)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDFDFDF)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
