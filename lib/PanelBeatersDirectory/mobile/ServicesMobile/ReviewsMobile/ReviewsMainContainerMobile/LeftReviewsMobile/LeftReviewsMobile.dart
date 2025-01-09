import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import '../../ReviewsComponentsMobile/ReviewIconButtonMobile.dart';
import 'LeftReviewsComponentsMobile/CommentContainerMobile.dart';
import 'LeftReviewsComponentsMobile/ReviewFilterButtonMobile.dart';
import 'LeftReviewsComponentsMobile/SearchBoxMobile.dart';

class LeftReviewsMobile extends StatefulWidget {
  const LeftReviewsMobile({super.key});

  @override
  State<LeftReviewsMobile> createState() => _LeftReviewsMobileState();
}

class _LeftReviewsMobileState extends State<LeftReviewsMobile> {
  final PageController _pageController = PageController();

  final List<List<CommentContainerMobile>> _commentGroups = [
    [
      CommentContainerMobile(
        starRating: '3',
        reviewName: 'Shaun Williams',
        reviewDate: '25 March 2024',
        review:
            'Excellent service received. The work they have done on my vehicle is outstanding! There is no indication that any repairs was done, the finishing is flawless.',
      ),
      CommentContainerMobile(
        starRating: '3',
        reviewName: 'Verona Medunsa',
        reviewDate: '10 January 2024',
        review:
            'Decent fender bender repair work, and the repair process was done in good time. I didn’t appreciate the staff attitudes though, they came across quite cold and unbothered.',
      ),
      CommentContainerMobile(
        starRating: '3',
        reviewName: 'Verona Medunsa',
        reviewDate: '10 January 2024',
        review:
            'Decent fender bender repair work, and the repair process was done in good time. I didn’t appreciate the staff attitudes though, they came across quite cold and unbothered.',
      ),
    ],
    [
      CommentContainerMobile(
        starRating: '4',
        reviewName: 'Jane Doe',
        reviewDate: '12 February 2024',
        review: 'Great service and timely repair. My car looks brand new!',
      ),
      CommentContainerMobile(
        starRating: '2',
        reviewName: 'John Smith',
        reviewDate: '20 March 2024',
        review: 'The repair was okay, but it took longer than expected.',
      ),
      CommentContainerMobile(
        starRating: '5',
        reviewName: 'Alice Johnson',
        reviewDate: '15 April 2024',
        review: 'Fantastic job! Very happy with the results. Highly recommend.',
      ),
    ],
    [
      CommentContainerMobile(
        starRating: '1',
        reviewName: 'Robert Brown',
        reviewDate: '18 May 2024',
        review:
            'Not satisfied with the service. There are still issues with my car.',
      ),
      CommentContainerMobile(
        starRating: '4',
        reviewName: 'Michael Green',
        reviewDate: '22 June 2024',
        review: 'Good job overall, but a bit pricey.',
      ),
      CommentContainerMobile(
        starRating: '3',
        reviewName: 'Laura White',
        reviewDate: '30 July 2024',
        review:
            'Average experience. The repair was okay, but customer service needs improvement.',
      ),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.85,
      height: MyUtility(context).height * 0.83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildHeader(),
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _commentGroups.map((group) {
                return Column(
                  children: group,
                );
              }).toList(),
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBoxMobile(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ReviewFilterButtonMobile(
                  filterType: 'Date Posted', onPressed: () {}),
              ReviewFilterButtonMobile(filterType: 'Lowest', onPressed: () {}),
              ReviewFilterButtonMobile(filterType: 'Highest', onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return SizedBox(
      width: MyUtility(context).width / 1.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReviewIconButtonMobile(
            onPressLeft: () {
              if (_pageController.page! > 0) {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            onPressRight: () {
              if (_pageController.page! < _commentGroups.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
