import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class MessageUsTextFieldMobile extends StatefulWidget {
  final TextEditingController controller;
  final String text;

  const MessageUsTextFieldMobile(
      {Key? key, required this.text, required this.controller})
      : super(key: key);

  @override
  State<MessageUsTextFieldMobile> createState() =>
      _MessageUsTextFieldMobileState();
}

class _MessageUsTextFieldMobileState extends State<MessageUsTextFieldMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
              fontFamily: 'raleway',
              fontSize: 16,
              color: Color(0xFF0C0C0C).withOpacity(0.55),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width / 1.4,
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
