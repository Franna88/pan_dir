import 'package:flutter/material.dart';

import '../../ReportCommentPopup/ReportCommentPopup.dart';

class ArticlesUserCommentsMobile extends StatefulWidget {
  final String username;
  final String comment;
  final String timeAgo;

  ArticlesUserCommentsMobile({
    required this.username,
    required this.comment,
    required this.timeAgo,
  });

  @override
  _ArticlesUserCommentsMobileState createState() =>
      _ArticlesUserCommentsMobileState();
}

class _ArticlesUserCommentsMobileState
    extends State<ArticlesUserCommentsMobile> {
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
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  fontFamily: 'ralewaybold',
                ),
              ),
              SizedBox(height: 8),
              Text(
                widget.comment,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widthDevice < 400 ? 12 : 14.96,
                  fontFamily: 'ralewaymedium',
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      size: 20,
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
                  SizedBox(width: 4),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.reply_outlined,
                      color: Colors.black,
                      size: 20,
                    ),
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
                  SizedBox(width: 4),
                  TextButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReportCommentPopupMobile();
                        },
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                      );
                    },
                    icon: Icon(
                      Icons.flag,
                      color: Colors.black,
                      size: 20,
                    ),
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
