import 'package:flutter/material.dart';

class SEOContainer extends StatefulWidget {
  final String text;

  const SEOContainer({super.key, required this.text});

  @override
  State<SEOContainer> createState() => _SEOContainerState();
}

class _SEOContainerState extends State<SEOContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 20,
        decoration: BoxDecoration(
            color: Color(0xFF5F6368).withOpacity(0.47),
            borderRadius: BorderRadius.circular(15.0)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 9,
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
