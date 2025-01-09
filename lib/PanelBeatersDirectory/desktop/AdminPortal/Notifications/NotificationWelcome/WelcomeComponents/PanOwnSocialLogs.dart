import 'package:flutter/material.dart';

class PanOwnSocialLogs extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  const PanOwnSocialLogs(
      {super.key,
      required this.imagePath,
      this.width = 50,
      this.height = 50,
      this.padding = const EdgeInsets.only(right: 2, left: 2)});

  @override
  State<PanOwnSocialLogs> createState() => _PanOwnSocialLogsState();
}

class _PanOwnSocialLogsState extends State<PanOwnSocialLogs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Image.asset(
        widget.imagePath,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
