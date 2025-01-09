import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrangeCheckMark extends StatelessWidget {
  const OrangeCheckMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xFFE2822B),
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              );
  }
}