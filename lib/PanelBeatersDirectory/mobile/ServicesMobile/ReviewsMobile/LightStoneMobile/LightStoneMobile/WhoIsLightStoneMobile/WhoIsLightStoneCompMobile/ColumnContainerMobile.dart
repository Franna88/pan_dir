import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ColumnContainerMobile extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;
  final List<String> section3Texts;

  const ColumnContainerMobile({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
    required this.section3Texts,
  }) : super(key: key);

  @override
  State<ColumnContainerMobile> createState() => _ColumnContainerMobileState();
}

class _ColumnContainerMobileState extends State<ColumnContainerMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.8,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          _buildSection(widget.section1Texts, 3),
          _buildSection(widget.section2Texts, 6),
          _buildSection(widget.section3Texts, 2),
        ],
      ),
    );
  }

  Widget _buildSection(List<String> texts, int columnWidthFactor) {
    return Expanded(
      flex: columnWidthFactor,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF5B5B5B)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildBoxes(texts),
        ),
      ),
    );
  }

  List<Widget> _buildBoxes(List<String> texts) {
    List<Widget> boxes = [];
    bool isAlternate = false;

    for (String text in texts) {
      boxes.add(Container(
        color: isAlternate ? Color(0xFF1D2124) : Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        height: MyUtility(context).height * 0.04,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.64,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ));

      isAlternate = !isAlternate;
    }

    return boxes;
  }
}
