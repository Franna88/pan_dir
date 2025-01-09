import 'package:flutter/material.dart';

class IndustySeoTags extends StatefulWidget {
  final String seoTags;

  const IndustySeoTags({super.key, required this.seoTags});

  @override
  State<IndustySeoTags> createState() => _IndustySeoTagsState();
}

class _IndustySeoTagsState extends State<IndustySeoTags> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0x775F6368),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.86),
        ),
      ),
      constraints: BoxConstraints(
        minWidth: 0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          widget.seoTags,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 7.6024,
            fontFamily: 'ralewaymedium',
          ),
        ),
      ),
    );
  }
}
