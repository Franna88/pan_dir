import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviewsComponents/RatingsSliderWithText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/myutility.dart';

class RatingReviewsMobile extends StatefulWidget {
  Function(int) changePageIndex;
  final List<Map<String, dynamic>> reviewsData;
  final bool waiting;
  RatingReviewsMobile(
      {Key? key,
      required this.changePageIndex,
      required this.reviewsData,
      required this.waiting})
      : super(key: key);

  @override
  State<RatingReviewsMobile> createState() => _RatingReviewsMobileState();
}

class _RatingReviewsMobileState extends State<RatingReviewsMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(10, 12, 0, 12),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '• Loved your experience?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Tell us about it! We appreciate positive feedback that helps us recognize and reward our amazing staff.\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "• Didn't meet your expectations?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " We want to hear why.  Your feedback is crucial to help us improve and ensure we deliver the best service possible.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.64,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            )),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Container(
          width: MyUtility(context).width * 0.85,
          height: MyUtility(context).height * 0.37,
          decoration: ShapeDecoration(
            color: Color(0xFF0E1013),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.46),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Ratings & Reviews (148) ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.7152,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MyUtility(context).height * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingSliderWithText(currentState: 5),
                          RatingSliderWithText(currentState: 4),
                          RatingSliderWithText(currentState: 3),
                          RatingSliderWithText(currentState: 2),
                          RatingSliderWithText(currentState: 1)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '4.5',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MyUtility(context).width * 0.045,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    width: MyUtility(context).width * 0.04,
                                    height: MyUtility(context).height * 0.04,
                                    child:
                                        SvgPicture.asset('images/reviews.svg'),
                                  )
                                ],
                              ),
                              Text(
                                '273 Reviews',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: MyUtility(context).width * 0.03,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.41,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '88%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MyUtility(context).width * 0.045,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                'Recommended',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: MyUtility(context).width * 0.03,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.41,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.85,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'By submitting a Review, you consent to us publishing the results online and/or sending it to the management team of ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.64,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'N4 Autocraft Panelbeaters - Pretoria East.',
                        style: TextStyle(
                          color: Color(0xFF64DAFF),
                          fontSize: 11.64,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  width: MyUtility(context).width * 0.5,
                  child: CommonButtonR(
                      buttonText: 'Leave Us a Review',
                      onPress: () {
                        widget.changePageIndex(1);
                      }))
            ],
          ),
        ),
      ],
    );
  }
}
