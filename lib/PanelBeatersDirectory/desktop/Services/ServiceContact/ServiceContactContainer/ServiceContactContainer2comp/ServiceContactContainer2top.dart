import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContainer2top extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;
  final List<String> section3Texts;
  final List<String> section4Texts;

  const ServiceContainer2top({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
    required this.section3Texts,
    required this.section4Texts,
  }) : super(key: key);

  @override
  State<ServiceContainer2top> createState() => _ServiceContainer2topState();
}

class _ServiceContainer2topState extends State<ServiceContainer2top> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder(
            horizontalInside: BorderSide(color: Color(0xFF5B5B5B)),
            verticalInside: BorderSide(color: Color(0xFF5B5B5B)),
          ),
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(1),
          },
          children: _buildTableRows(widget.section1Texts, widget.section2Texts,
              widget.section3Texts, widget.section4Texts),
        ),
      ),
    );
  }

  List<TableRow> _buildTableRows(
      List<String> section1Texts,
      List<String> section2Texts,
      List<String> section3Texts,
      List<String> section4Texts) {
    int maxLength = [
      section1Texts.length,
      section2Texts.length,
      section3Texts.length,
      section4Texts.length
    ].reduce((a, b) => a > b ? a : b);

    List<TableRow> rows = [];

    for (int i = 0; i < maxLength; i++) {
      rows.add(TableRow(
        children: [
          _buildCell(section1Texts, i),
          _buildCell(section2Texts, i),
          _buildCell(section3Texts, i),
          _buildCell(section4Texts, i),
        ],
      ));
    }

    return rows;
  }

  Widget _buildCell(List<String> texts, int index) {
    bool isAlternate = index % 2 == 0;
    return Container(
      color: isAlternate ? Color(0xFF0E1013) : Color(0x7F292E31),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.centerLeft,
      height: MyUtility(context).height * 0.05,
      child: index < texts.length
          ? Text(
              texts[index],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            )
          : null, // Leave cell empty if there's no text for this index
    );
  }
}
