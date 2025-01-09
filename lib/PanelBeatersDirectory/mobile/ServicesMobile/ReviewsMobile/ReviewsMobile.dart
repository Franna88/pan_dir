import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ReviewsMobile/ReviewsOrangeContainerMobile/ReviewsOrangeContainerMobile.dart';

class ReviewsMobile extends StatefulWidget {
  const ReviewsMobile({super.key});

  @override
  State<ReviewsMobile> createState() => _ReviewsMobileState();
}

class _ReviewsMobileState extends State<ReviewsMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ReviewsOrangeContainerMobile()
      ],
    );
  }
}
