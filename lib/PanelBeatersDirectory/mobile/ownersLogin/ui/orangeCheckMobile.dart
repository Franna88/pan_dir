import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrangeCheckMobile extends StatelessWidget {
  const OrangeCheckMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 20,
                height: 20,
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