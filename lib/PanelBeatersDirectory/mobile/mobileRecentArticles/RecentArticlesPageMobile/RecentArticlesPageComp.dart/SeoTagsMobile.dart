import 'package:flutter/material.dart';

class SeoTagsMobile extends StatefulWidget {
  final String seoTag;

  const SeoTagsMobile({super.key, required this.seoTag});

  @override
  State<SeoTagsMobile> createState() => _SeoTagsMobileState();
}

class _SeoTagsMobileState extends State<SeoTagsMobile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Text(
                widget.seoTag,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.42,
                  fontFamily: 'ralewaysemi',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
