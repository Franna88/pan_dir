import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/ReviewsOrangeContainer/ReviewsOrangeContainer.dart';
import 'package:webdirectories/myutility.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ReviewsOrangeContainer(),
        SizedBox(
          height: MyUtility(context).height * 0.025,
        )
      ],
    );
  }
}
