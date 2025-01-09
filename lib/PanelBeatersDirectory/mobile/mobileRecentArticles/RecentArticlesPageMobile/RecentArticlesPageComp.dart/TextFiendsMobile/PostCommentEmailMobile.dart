import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PostCommentEmailMobile extends StatefulWidget {
  final TextEditingController controller;

  const PostCommentEmailMobile({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PostCommentEmailMobile> createState() => _PostCommentEmailMobileState();
}

class _PostCommentEmailMobileState extends State<PostCommentEmailMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
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
          fontSize: 13.56,
          fontFamily: 'raleway',
        ),
        decoration: InputDecoration(
          hintText: '*Email address',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 13.56,
            fontFamily: 'raleway',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 8,
          ),
        ),
      ),
    );
  }
}
