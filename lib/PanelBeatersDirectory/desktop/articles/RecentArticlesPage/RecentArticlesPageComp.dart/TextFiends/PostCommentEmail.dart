import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PostCommentEmail extends StatefulWidget {
  final TextEditingController controller;

  const PostCommentEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PostCommentEmail> createState() => _PostCommentEmailState();
}

class _PostCommentEmailState extends State<PostCommentEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: 36,
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'raleway',
        ),
        decoration: InputDecoration(
          hintText: '*Email address',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 16,
            fontFamily: 'raleway',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
        ),
      ),
    );
  }
}
