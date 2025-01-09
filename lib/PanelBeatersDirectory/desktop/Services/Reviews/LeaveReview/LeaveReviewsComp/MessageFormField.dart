import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class MessageFormField extends StatefulWidget {
  final TextEditingController controller;
  const MessageFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MessageFormField> createState() => _MessageFormFieldState();
}

class _MessageFormFieldState extends State<MessageFormField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.31,
      height: MyUtility(context).width * 0.08,
      decoration: ShapeDecoration(
        color: Color(0x00D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: MyUtility(context).width * 0.01,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: '*Message',
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: MyUtility(context).width * 0.01,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -15.0),
          ),
        ),
      ),
    );
  }
}
