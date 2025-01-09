import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ImageMobileContainer extends StatefulWidget {
  final String image;

  const ImageMobileContainer({super.key, required this.image});

  @override
  State<ImageMobileContainer> createState() => _ImageMobileContainerState();
}

class _ImageMobileContainerState extends State<ImageMobileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.89,
      height: MyUtility(context).height * 0.32,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
