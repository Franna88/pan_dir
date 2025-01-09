import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

import 'LightStoneComp/PercentageText.dart';

class LightStoneEcho extends StatefulWidget {
  final String percentage;
  const LightStoneEcho({super.key, required this.percentage});

  @override
  State<LightStoneEcho> createState() => _LightStoneEchoState();
}

class _LightStoneEchoState extends State<LightStoneEcho> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Lightstone EchoMBR KAI Index',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.0145,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        Stack(
          children: [
            SvgPicture.asset('images/noneedle.svg',
                height: MyUtility(context).height * 0.6,
                width: MyUtility(context).width * 0.4),
            Positioned(
                bottom: MyUtility(context).height * 0.1,
                left: MyUtility(context).width * 0.096,
                child: PercentageText(percentage: widget.percentage)),
          ],
        )
      ],
    );
  }
}
