import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class SEOTagsMobile extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const SEOTagsMobile({super.key, required this.text, required this.onpress});

  @override
  State<SEOTagsMobile> createState() => _SEOTagsMobileState();
}

class _SEOTagsMobileState extends State<SEOTagsMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyUtility(context).height * 0.033,
      child: ElevatedButton(
        onPressed: widget.onpress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5F6368).withOpacity(0.47),
          foregroundColor: Colors.white,
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 9,
            fontFamily: 'ralewaysemi',
          ),
        ),
      ),
    );
  }
}
