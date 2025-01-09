import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'LightStoneEcho/LightStoneEchoMobile.dart';
import 'WhoIsLightStoneMobile/WhoIsLightStoneMobile.dart';

class LightStoneMobile extends StatefulWidget {
  const LightStoneMobile({super.key});

  @override
  State<LightStoneMobile> createState() => _LightStoneMobileState();
}

class _LightStoneMobileState extends State<LightStoneMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [LightStoneEchoMobile(), WhoIsLightStoneMobile()],
        ),
      ),
    );
  }
}
