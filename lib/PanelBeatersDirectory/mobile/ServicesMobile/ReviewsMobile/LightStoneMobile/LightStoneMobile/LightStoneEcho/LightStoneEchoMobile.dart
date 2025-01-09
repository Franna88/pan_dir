import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

import 'LightStoneCompMobile/PercentageTextMobile.dart';

class LightStoneEchoMobile extends StatefulWidget {
  const LightStoneEchoMobile({super.key});

  @override
  State<LightStoneEchoMobile> createState() => _LightStoneEchoMobileState();
}

class _LightStoneEchoMobileState extends State<LightStoneEchoMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Lightstone EchoMBR KAI Index',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.045,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        Stack(
          children: [
            SizedBox(
              width: MyUtility(context).width * 0.75,
              child: SvgPicture.asset('images/noneedle.svg',
                  height: MyUtility(context).height * 0.4,
                  width: MyUtility(context).width * 0.35),
            ),
            Positioned(
                bottom: MyUtility(context).height * 0.075,
                left: 0,
                right: 0,
                child: PercentageTextMobile(percentage: '98')),
          ],
        )
      ],
    );
  }
}
