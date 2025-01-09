import 'package:flutter/cupertino.dart';

class Performancetags extends StatefulWidget {
  final String header;
  final String figures;
  const Performancetags(
      {super.key, required this.header, required this.figures});

  @override
  State<Performancetags> createState() => _PerformancetagsState();
}

class _PerformancetagsState extends State<Performancetags> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.header,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFCCCCCC),
            fontSize: 17.7488,
            fontFamily: 'ralewaymedium',
          ),
        ),
        Text(
          widget.figures,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFFF8728),
            fontSize: 32.192,
            fontFamily: 'ralewaysemi',
          ),
        )
      ],
    );
  }
}
