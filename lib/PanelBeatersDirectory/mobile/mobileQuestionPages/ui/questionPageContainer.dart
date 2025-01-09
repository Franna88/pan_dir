import 'dart:ui';
import 'package:flutter/material.dart';

class QuestionPageContainer extends StatelessWidget {
  final Widget child;

  QuestionPageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: widthDevice * 0.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200.withOpacity(0.3),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
