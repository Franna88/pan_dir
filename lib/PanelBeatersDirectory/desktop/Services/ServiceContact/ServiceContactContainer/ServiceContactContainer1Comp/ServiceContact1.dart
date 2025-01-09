import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ServiceContact1 extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;

  const ServiceContact1({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
  }) : super(key: key);

  @override
  State<ServiceContact1> createState() => _ServiceContact1State();
}

class _ServiceContact1State extends State<ServiceContact1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: Color(0xFF5B5B5B)),
          verticalInside: BorderSide(color: Color(0xFF5B5B5B)),
        ),
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(4),
        },
        children: _buildTableRows(widget.section1Texts, widget.section2Texts),
      ),
    );
  }

  List<TableRow> _buildTableRows(
      List<String> section1Texts, List<String> section2Texts) {
    List<TableRow> rows = [];

    for (int i = 0; i < section1Texts.length; i++) {
      rows.add(TableRow(
        children: [
          Container(
            color: i.isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            height: MyUtility(context).height * 0.05,
            child: Text(
              section1Texts[i],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            color: i.isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            height: MyUtility(context).height * 0.05,
            child: Text(
              section2Texts[i],
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ));
    }

    return rows;
  }
}
