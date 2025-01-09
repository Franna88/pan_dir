import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReview.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/LeftReviews/LeftReviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviesMainContainer/RatingReviews/RatingReviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsComponents/ReviewIconButtons.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsMainContainer extends StatefulWidget {
  final List<Map<String, dynamic>> reviewsData;
  final Function(Map<String, dynamic>) onLeaveReview;
  final bool waiting;
  final String listingEmail;
  const ReviewsMainContainer(
      {super.key,
      required this.reviewsData,
      required this.waiting,
      required this.onLeaveReview,
      required this.listingEmail});

  @override
  State<ReviewsMainContainer> createState() => _ReviewsMainContainerState();
}

class _ReviewsMainContainerState extends State<ReviewsMainContainer> {
  var pageIndex = 0;
  var reviewsPageIndex = 0;
  var _currentReviewPage = 0;
  var _reviewsPerPage = 2;
  String _searchQuery = '';
  String _filterType = 'Date Posted';

  List<Map<String, dynamic>> get _filteredReviews {
    List<Map<String, dynamic>> filtered = widget.reviewsData;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((review) {
        print('review: $review');
        return review['data']['ratingMessage']
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    // Apply sorting filter
    if (_filterType == 'Highest') {
      filtered
          .sort((a, b) => b['data']['rating'].compareTo(a['data']['rating']));
    } else if (_filterType == 'Lowest') {
      filtered
          .sort((a, b) => a['data']['rating'].compareTo(b['data']['rating']));
    } else if (_filterType == 'Date Posted') {
      filtered.sort(
          (a, b) => b['data']['ratingDate'].compareTo(a['data']['ratingDate']));
    }

    return filtered;
  }

  List<Map<String, dynamic>> get _currentPageReviews {
    int start = _currentReviewPage * _reviewsPerPage;
    int end = start + _reviewsPerPage;
    end = end > _filteredReviews.length ? _filteredReviews.length : end;
    return _filteredReviews.sublist(start, end);
  }

  void _nextPage() {
    if ((_currentReviewPage + 1) * _reviewsPerPage < _filteredReviews.length) {
      setState(() {
        _currentReviewPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentReviewPage > 0) {
      setState(() {
        _currentReviewPage--;
      });
    }
  }

  //this function changes page index
  changePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _onFilterChanged(String filterType) {
    setState(() {
      _filterType = filterType;
    });
  }

  @override
  Widget build(BuildContext context) {
    List reviewPages = [
      RatingReviews(
          changePageIndex: changePageIndex, reviewsData: widget.reviewsData),
      LeaveReview(
        changePageIndex: changePageIndex,
        onReviewSubmit: widget.onLeaveReview,
        listingEmail: widget.listingEmail,
      ),
    ];
    return Container(
      width: MyUtility(context).width * 0.84,
      height: MyUtility(context).height * 0.7,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Loved your experience?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " Tell us about it! We appreciate positive feedback that helps us recognize and reward our amazing staff.\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                    text: "Didn't meet your expectations?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text:
                        " We want to hear why.  Your feedback is crucial to help us improve and ensure we deliver the best service possible.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.011,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              widget.waiting == true
                  ? SizedBox(
                      width: MyUtility(context).width * 0.4,
                      child: Center(
                          child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ))))
                  : reviewPages[pageIndex],
              LeftReviews(
                reviews: _currentPageReviews,
                onFilter: _onFilterChanged,
                onSearch: _onSearchChanged,
              ) /**/
            ],
          ),
          SizedBox(
            width: MyUtility(context).width / 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReviewIconButton(
                  onTapPrevious: () {
                    _previousPage();
                  },
                  onTapNext: () {
                    _nextPage();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
