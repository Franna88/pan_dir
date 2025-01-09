import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviewsComponents/RatingsSliderWithText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class RatingReviews extends StatefulWidget {
  Function(int) changePageIndex;
  final List<Map<String, dynamic>> reviewsData;
  RatingReviews(
      {Key? key, required this.changePageIndex, required this.reviewsData})
      : super(key: key);

  @override
  State<RatingReviews> createState() => _RatingReviewsState();
}

class _RatingReviewsState extends State<RatingReviews> {
  String title = '';
  @override
  void initState() {
    _getTitle();
    super.initState();
  }

  void _getTitle() async {
    String? name = await storage.read(key: 'title');
    print(name);
    if (name != null) {
      setState(() {
        title = name;
      });
    }
  }

  double calculateAverageRating(List<Map<String, dynamic>> reviews) {
    if (reviews.isEmpty) {
      return 0.0; // Return 0 if there are no reviews
    }

    double totalRating =
        reviews.fold(0.0, (sum, review) => sum + (review['rating'] as double));
    return totalRating / reviews.length;
  }

  double calculateRecommendationPercentage(List<Map<String, dynamic>> reviews) {
    if (reviews.isEmpty) {
      return 0.0; // Return 0 if there are no reviews
    }

    int recommendedCount =
        reviews.where((review) => review['rating'] >= 4.0).length;
    return (recommendedCount / reviews.length) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.52,
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
            'Ratings & Reviews (${widget.reviewsData.length})',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyUtility(context).width * 0.0152,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: MyUtility(context).height * 0.2,
                child: widget.reviewsData.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingSliderWithText(
                              currentState: 5,
                              sliderAmount: (widget.reviewsData
                                      .where((el) => el['rating'] == 5)
                                      .toList()
                                      .length /
                                  widget.reviewsData.length)),
                          RatingSliderWithText(
                              currentState: 4,
                              sliderAmount: (widget.reviewsData
                                      .where((el) => el['rating'] == 4)
                                      .toList()
                                      .length /
                                  widget.reviewsData.length)),
                          RatingSliderWithText(
                              currentState: 3,
                              sliderAmount: (widget.reviewsData
                                      .where((el) => el['rating'] == 3)
                                      .toList()
                                      .length /
                                  widget.reviewsData.length)),
                          RatingSliderWithText(
                              currentState: 2,
                              sliderAmount: (widget.reviewsData
                                      .where((el) => el['rating'] == 2)
                                      .toList()
                                      .length /
                                  widget.reviewsData.length)),
                          RatingSliderWithText(
                              currentState: 1,
                              sliderAmount: (widget.reviewsData
                                      .where((el) => el['rating'] == 1)
                                      .toList()
                                      .length /
                                  widget.reviewsData.length)),
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
                              calculateAverageRating(widget.reviewsData)
                                  .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MyUtility(context).width * 0.0125,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Container(
                              width: 11.04,
                              height: 11.04,
                              child: SvgPicture.asset('images/reviews.svg'),
                            )
                          ],
                        ),
                        Text(
                          '${widget.reviewsData.length} Reviews',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: MyUtility(context).width * 0.006,
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
                          '${calculateRecommendationPercentage(widget.reviewsData).toStringAsFixed(0)}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MyUtility(context).width * 0.0125,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: MyUtility(context).width * 0.006,
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
          SizedBox(
            width: 422.008,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By submitting a Review, you consent to us publishing the results online and/or sending it to the management team of ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: TextStyle(
                      color: Color(0xFF64DAFF),
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          CommonButtonR(
              buttonText: 'Leave Us a Review',
              onPress: () {
                widget.changePageIndex(1);
              })
        ],
      ),
    );
  }
}
