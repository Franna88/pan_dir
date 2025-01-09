import 'package:flutter/material.dart';

class MobileSeo extends StatefulWidget {
  final String text;

  const MobileSeo({super.key, required this.text});

  @override
  State<MobileSeo> createState() => _MobileSeoState();
}

class _MobileSeoState extends State<MobileSeo> {
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
                fontSize: 7.8,
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
