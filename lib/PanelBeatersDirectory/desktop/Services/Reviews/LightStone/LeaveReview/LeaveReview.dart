import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReviewsComp/LeaveReviewFormField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReviewsComp/LongFormField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReviewsComp/MessageFormField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LeaveReview/LeaveReviewsComp/SelectStar.dart';
import 'package:webdirectories/myutility.dart';

class LeaveReview extends StatefulWidget {
  const LeaveReview({Key? key}) : super(key: key);

  @override
  State<LeaveReview> createState() => _LeaveReviewState();
}

class _LeaveReviewState extends State<LeaveReview> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 497.08,
      height: 365.92,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.46),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Color(0x7FD9D9D9),
          alwaysVisibleScrollThumb: true,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Leave Review',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.46,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MyUtility(context).width / 3.24,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LeaveReviewFormField(
                              reviewInfo: 'First name',
                            ),
                            LeaveReviewFormField(
                              reviewInfo: 'Last name',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: LongFormField(
                        reviewInfo: '*Email address',
                      ),
                    ),
                    Text(
                      '*Score',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.699999988079071),
                        fontSize: 13.6,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SelectStar(
                        onRatingChanged: (rating) {
                          print('Selected rating: $rating');
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MessageFormField(
                        controller: _messageController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child:
                          LongFormField(reviewInfo: 'Add Image if Applicable'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Color(0xFFFF8728),
                          foregroundColor: Colors.black,
                          minimumSize: Size(100.8, 39),
                        ),
                        child: Text(
                          'Post Review',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.06,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
