import 'package:flutter/material.dart';

import 'AboutUsLeftContentComp/AboutUSContainerInfo.dart';

class AboutUsLeftContent extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;
  const AboutUsLeftContent(
      {super.key, required this.section1Texts, required this.section2Texts});

  @override
  State<AboutUsLeftContent> createState() => _AboutUsLeftContentState();
}

class _AboutUsLeftContentState extends State<AboutUsLeftContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.section1Texts.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : AboutUsContainerInfo(
                section1Texts: widget.section1Texts,
                section2Texts: widget.section2Texts,
              ),
      ],
    );
  }
}
