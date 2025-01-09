import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureButton extends StatefulWidget {
  final String imagePath;
  final VoidCallback onPress;

  const SvgPictureButton(
      {super.key, required this.imagePath, required this.onPress});

  @override
  State<SvgPictureButton> createState() => _SvgPictureButtonState();
}

class _SvgPictureButtonState extends State<SvgPictureButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          width: 41.68,
          height: 41.68,
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
