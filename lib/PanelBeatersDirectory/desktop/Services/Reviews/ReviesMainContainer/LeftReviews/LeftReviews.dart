import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/CommentContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/ReviewFilterButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviewsComponents/searchBox.dart';
import 'package:webdirectories/myutility.dart';

class LeftReviews extends StatefulWidget {
  final List<Map<String, dynamic>> reviews;
  final Function(String) onSearch;
  final Function(String) onFilter;

  const LeftReviews(
      {super.key,
      required this.reviews,
      required this.onSearch,
      required this.onFilter});

  @override
  State<LeftReviews> createState() => _LeftReviewsState();
}

class _LeftReviewsState extends State<LeftReviews> {
  Map data = {};
  @override
  void initState() {
//Map out data to use
    /* (widget.reviews).forEach((dynamic key, dynamic value) {
      setState(() {
        data.addAll({key: value});
      });
    });*/
    print("REVIEW");

    print(widget.reviews);
    widget.reviews.map((review) {
      print(review);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.4,
      height: MyUtility(context).height * 0.51,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchBox(
                onSearch: widget.onSearch,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ReviewFilterButton(
                      filterType: 'Date Posted',
                      onPressed: () {
                        widget.onFilter('Date Posted');
                      }),
                  ReviewFilterButton(
                      filterType: 'Lowest',
                      onPressed: () {
                        widget.onFilter('Date Posted');
                      }),
                  ReviewFilterButton(
                      filterType: 'Highest',
                      onPressed: () {
                        widget.onFilter('Date Posted');
                      })
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          Column(
            children: [
              ...widget.reviews.map((review) {
                print(review['data']['ratingMessage']);
                print(review['data']);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CommentContainer(
                    starRating: review['rating'].toString(),
                    reviewName: review['data']['ratingFrom'],
                    reviewDate: review['data']['ratingMessage'],
                    review: review['data']['ratingDate'],
                  ),
                );
              }).toList(),
            ],
          )
        ],
      ),
    );
  }
}
