import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CommentsContainer extends StatefulWidget {
  final String profileimage;
  final String comment;
  final String username;

  const CommentsContainer(
      {super.key,
      required this.profileimage,
      required this.comment,
      required this.username});

  @override
  State<CommentsContainer> createState() => _CommentsContainerState();
}

class _CommentsContainerState extends State<CommentsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 1.2,
      height: MyUtility(context).height * 0.4,
      decoration: BoxDecoration(
          color: Color(0xFF0E1013), borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(widget.profileimage),
          ),
          SizedBox(
            width: MyUtility(context).width / 1.5,
            child: Text(
              widget.comment,
              style: TextStyle(
                  fontSize: 15.5,
                  fontFamily: 'raleway',
                  color: Color(0xFFFFFFFF)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width / 1.5,
            child: Text(
              widget.username,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ralewaysemi',
                  color: Color(0xFFFFFFFF)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
