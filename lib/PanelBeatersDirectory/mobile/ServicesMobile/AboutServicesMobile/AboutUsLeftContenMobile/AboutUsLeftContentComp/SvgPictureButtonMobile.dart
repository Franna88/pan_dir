import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureButtonMobile extends StatefulWidget {
  final String imagePath;
  final VoidCallback onPress;

  const SvgPictureButtonMobile(
      {super.key, required this.imagePath, required this.onPress});

  @override
  State<SvgPictureButtonMobile> createState() => _SvgPictureButtonMobileState();
}

class _SvgPictureButtonMobileState extends State<SvgPictureButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SvgPicture.asset(
            widget.imagePath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
