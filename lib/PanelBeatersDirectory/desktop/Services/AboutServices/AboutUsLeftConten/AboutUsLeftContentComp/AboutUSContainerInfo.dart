import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AboutUsContainerInfo extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;

  const AboutUsContainerInfo({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
  }) : super(key: key);

  @override
  State<AboutUsContainerInfo> createState() => _AboutUsContainerInfoState();
}

class _AboutUsContainerInfoState extends State<AboutUsContainerInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.4,
      height: 487.2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Color(0xFF5B5B5B)),
          verticalInside: BorderSide(color: Color(0xFF5B5B5B)),
        ),
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        children: _buildTableRows(widget.section1Texts, widget.section2Texts),
      ),
    );
  }

  List<TableRow> _buildTableRows(
      List<String> section1Texts, List<String> section2Texts) {
    int maxLength = [
      section1Texts.length,
      section2Texts.length,
    ].reduce((a, b) => a > b ? a : b);

    List<TableRow> rows = [];

    for (int i = 0; i < maxLength; i++) {
      rows.add(TableRow(
        children: [
          _buildCell(section1Texts, i),
          _buildCell(section2Texts, i),
        ],
      ));
    }

    return rows;
  }

  Widget _buildCell(List<String> texts, int index) {
    bool isAlternate = index % 2 == 0;
    return Container(
      color: isAlternate ? Color(0xFF1D2023) : Colors.black,
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
