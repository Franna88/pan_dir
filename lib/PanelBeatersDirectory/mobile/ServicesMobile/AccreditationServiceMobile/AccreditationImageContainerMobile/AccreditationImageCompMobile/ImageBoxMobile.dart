import 'package:flutter/material.dart';

class ImageBoxMobile extends StatelessWidget {
  const ImageBoxMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121.04,
      height: 116.04,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Airbag.png"),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
