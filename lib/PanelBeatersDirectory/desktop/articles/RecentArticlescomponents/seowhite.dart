import 'package:flutter/material.dart';

class SEOWhite extends StatefulWidget {
  final String text;

  const SEOWhite({super.key, required this.text});

  @override
  State<SEOWhite> createState() => _SEOWhiteState();
}

class _SEOWhiteState extends State<SEOWhite> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2.5),
      child: Container(
        height: 9.65,
        decoration: BoxDecoration(
            color: Color(0xFF5F6368).withOpacity(0.47),
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 2.5),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 4.488,
                color: Colors.white,
                fontFamily: 'ralewaysemi',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
