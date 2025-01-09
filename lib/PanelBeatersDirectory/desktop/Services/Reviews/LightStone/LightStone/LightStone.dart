import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

import 'LightStoneEcho/LightStoneEcho.dart';
import 'WhoIsLightStone/WhoIsLightStone.dart';

class LightStone extends StatefulWidget {
  final Map<String, dynamic> data;
  const LightStone({super.key, required this.data});

  @override
  State<LightStone> createState() => _LightStoneState();
}

class _LightStoneState extends State<LightStone> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.837,
      height: MyUtility(context).height * 0.7,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LightStoneEcho(
            percentage: widget.data['lightstoneScore'].toString(),
          ),
          WhoIsLightStone(
            data: widget.data,
          )
        ],
      ),
    );
  }
}
