import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class GreyTable extends StatelessWidget {
  Widget child;
  double width;
  GreyTable({super.key, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(left: 10, top: heightDevice < 710 ? 8 : 13),
      width: MyUtility(context).width * 0.1, //125 //175
      height: heightDevice < 710 ? 30 : 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 48, 48, 48),
        border: Border(
          left: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
          top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
          right: BorderSide(color: Color(0xFF5B5B5B)),
          bottom: BorderSide(color: Color(0xFF5B5B5B)),
        ),
      ),
      child: child,
    );
  }
}
