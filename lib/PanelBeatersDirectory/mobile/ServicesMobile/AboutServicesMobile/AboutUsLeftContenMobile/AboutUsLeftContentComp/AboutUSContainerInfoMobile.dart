import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class InfoContainer extends StatefulWidget {
  final List<String> section1Texts;
  final List<String> section2Texts;

  const InfoContainer({
    Key? key,
    required this.section1Texts,
    required this.section2Texts,
  }) : super(key: key);

  @override
  State<InfoContainer> createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> {
  @override
  Widget build(BuildContext context) {
    int maxLength = widget.section1Texts.length > widget.section2Texts.length
        ? widget.section1Texts.length
        : widget.section2Texts.length;

    return Container(
      width: MyUtility(context).width * 0.9,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: List.generate(maxLength, (index) {
          return IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  flex: 7, // 6 parts
                  child: _buildBox(index < widget.section1Texts.length
                      ? widget.section1Texts[index]
                      : ""),
                ),
                Expanded(
                  flex: 5, // 5 parts
                  child: _buildBox(index < widget.section2Texts.length
                      ? widget.section2Texts[index]
                      : ""),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBox(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Color(0xFF5B5B5B)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      alignment: Alignment.centerLeft,
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
    );
  }
}
