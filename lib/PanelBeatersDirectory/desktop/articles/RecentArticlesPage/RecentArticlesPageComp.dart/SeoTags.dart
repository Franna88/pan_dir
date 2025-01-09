import 'package:flutter/material.dart';

class SeoTags extends StatefulWidget {
  final String seoTag;

  const SeoTags({super.key, required this.seoTag});

  @override
  State<SeoTags> createState() => _SeoTagsState();
}

class _SeoTagsState extends State<SeoTags> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100.64,
        height: 27.64,
        decoration: ShapeDecoration(
          color: Color(0x775F6368),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.seoTag,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.6,
                fontFamily: 'ralewaysemi',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
