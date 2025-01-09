import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

import '../../../Services/Reviews/LightStone/LightStone/LightStoneEcho/LightStoneComp/PercentageText.dart';
import 'AdminPercentageText.dart';

class AdminLightEco extends StatefulWidget {
  final String percentage;
  const AdminLightEco({super.key, required this.percentage});

  @override
  State<AdminLightEco> createState() => _AdminLightEcoState();
}

class _AdminLightEcoState extends State<AdminLightEco>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // Animation start
    _controller = AnimationController(
      lowerBound: 0.0,
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    var percent = (double.parse(widget.percentage)) / 100;
    print("PERCENT");
    print(percent);
    _controller.animateTo(percent);
    super.initState();
  }

  @override
  void dispose() {
    // End animation
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.06,
        ),
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
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Stack(
          children: [
            SvgPicture.asset('images/noneedle.svg',
                height: MyUtility(context).height * 0.55,
                width: MyUtility(context).width * 0.4),
            Positioned(
              top: MyUtility(context).height * 0.08,
              right: 0,
              left: 0,
              child: Container(
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: Tween(begin: 0.0, end: 1.4).animate(_controller),
                  child: Container(
                    height: MyUtility(context).height * 0.40,
                    width: MyUtility(context).width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/red1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: MyUtility(context).height * 0.08,
                left: MyUtility(context).width * 0.09,
                child: AdminPercentageText(percentage: widget.percentage)),
          ],
        )
      ],
    );
  }
}
