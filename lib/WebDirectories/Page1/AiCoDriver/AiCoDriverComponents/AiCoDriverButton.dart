import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AiCoDriverButton extends StatefulWidget {
  final String image;
  final VoidCallback onpress;

  const AiCoDriverButton(
      {super.key, required this.image, required this.onpress});

  @override
  State<AiCoDriverButton> createState() => _AiCoDriverButtonState();
}

class _AiCoDriverButtonState extends State<AiCoDriverButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: widget.onpress,
        child: Image.asset(
          widget.image,
          width: MyUtility(context).width * 0.105,
          height: 45,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
