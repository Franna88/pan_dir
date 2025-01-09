import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/LightStoneMobile/LightStoneMobile/LightStoneMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/ReviewsComponentsMobile/ReviewsNAvButtonMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/ReviewsMainContainerMobile/ReviewsMainContainerMobile.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsOrangeContainerMobile extends StatefulWidget {
  const ReviewsOrangeContainerMobile({super.key});

  @override
  State<ReviewsOrangeContainerMobile> createState() =>
      _ReviewsOrangeContainerMobileState();
}

class _ReviewsOrangeContainerMobileState
    extends State<ReviewsOrangeContainerMobile> {
  //var
  List reviewPages = [ReviewsMainContainerMobile(), LightStoneMobile()];
  var pageIndex = 0;

  //this function changes page index
  changePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewsNAvButtonMobile(
              changePageIndex: changePageIndex,
              pageIndex: pageIndex,
            ),
            Container(
              width: MyUtility(context).width * 0.91,
              decoration: ShapeDecoration(
                color: Color(0xFFFF8828),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: reviewPages[pageIndex],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ],
    );
  }
}
