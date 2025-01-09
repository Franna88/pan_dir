import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ImageContainer extends StatefulWidget {
  final String image;

  const ImageContainer({super.key, required this.image});

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.16,
      height: MyUtility(context).height * 0.267,
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
