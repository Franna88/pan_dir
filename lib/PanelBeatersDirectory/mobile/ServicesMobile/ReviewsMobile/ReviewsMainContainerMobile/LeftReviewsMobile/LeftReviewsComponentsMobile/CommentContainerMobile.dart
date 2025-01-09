import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/StarRating.dart';
import 'package:webdirectories/myutility.dart';

class CommentContainerMobile extends StatefulWidget {
  final String starRating;
  final String reviewName;
  final String reviewDate;
  final String review;

  const CommentContainerMobile({
    Key? key,
    required this.starRating,
    required this.reviewName,
    required this.reviewDate,
    required this.review,
  }) : super(key: key);

  @override
  State<CommentContainerMobile> createState() => _CommentContainerMobileState();
}

class _CommentContainerMobileState extends State<CommentContainerMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: MyUtility(context).width * 0.8,
        height: MyUtility(context).height * 0.22,
        decoration: ShapeDecoration(
          color: Color(0xFF3C4043),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(20.95),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: StarRating(
                      stars: widget.starRating,
                    ),
                  ),
                  Text(
                    '${widget.starRating} out of 5 stars',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                '${widget.reviewName} - ${widget.reviewDate}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'ralewaysemi',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.review,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
