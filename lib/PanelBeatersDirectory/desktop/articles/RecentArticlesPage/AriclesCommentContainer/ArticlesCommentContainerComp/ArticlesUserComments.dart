import 'package:flutter/material.dart';

import '../../../ReportCommentPopup/ReportCommentPopup.dart';

class ArticlesUserComments extends StatefulWidget {
  final String username;
  final String comment;
  final String timeAgo;

  ArticlesUserComments({
    required this.username,
    required this.comment,
    required this.timeAgo,
  });

  @override
  _ArticlesUserCommentsState createState() => _ArticlesUserCommentsState();
}

class _ArticlesUserCommentsState extends State<ArticlesUserComments> {
  bool isLiked = false;
  bool showHeart = false;

  void handleLike() {
    setState(() {
      showHeart = true;
    });
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLiked = !isLiked;
        showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: Color(0xFFFFFEFE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.timeAgo,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.56,
                  fontFamily: 'ralewaymedium',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.username,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'ralewayBold',
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.comment,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.96,
                  fontFamily: 'ralewaymedium',
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      showHeart
                          ? Icons.favorite
                          : isLiked
                              ? Icons.thumb_up
                              : Icons.thumb_up_off_alt_outlined,
                      color: showHeart
                          ? Colors.red
                          : (isLiked ? Colors.blue : Colors.black),
                    ),
                    onPressed: handleLike,
                  ),
                  Text(
                    'Like',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11.56,
                      fontFamily: 'ralewaymedium',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () {
                      // Handle reply action
                    },
                    icon: Icon(Icons.reply_outlined, color: Colors.black),
                    label: Text(
                      'Reply',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.56,
                        fontFamily: 'ralewaymedium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReportCommentPopup();
                        },
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                      );
                    },
                    icon: Icon(Icons.flag, color: Colors.black),
                    label: Text(
                      'Report',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11.56,
                        fontFamily: 'ralewaymedium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
