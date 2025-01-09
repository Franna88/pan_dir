import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CategorySelect extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  Function startFlickering;
  CategorySelect({
    super.key,
    required this.menuIndex,
    required this.changeMenu,
    required this.startFlickering,
  });

  @override
  State<CategorySelect> createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _blinkController;
  late Animation<Color?> _blinkAnimation;

  double top = 120;
  double right = 185;

  @override
  void initState() {
    super.initState();

    // Rotation animation
    _controller = AnimationController(
      lowerBound: -0.6,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.animateTo(-0.32);

    // Blink animation
    _blinkController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _blinkAnimation = ColorTween(
      begin: Colors.white,
      end: Color.fromRGBO(0, 128, 4, 1),
    ).animate(_blinkController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MyUtility(context).width;

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 555,
              height: 555,
            ),
            Positioned(
              top: 8,
              left: 33,
              child: Container(
                child: SvgPicture.asset(
                  'images/centerGauge2.svg',
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            Positioned(
              top: -11.6,
              left: 161.6,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                  _controller.animateTo(0.005);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/fuelSvg.svg'
                        : 'images/top1.svg',
                    width: 1,
                    height: 222,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 72,
              left: 27,
              child: GestureDetector(
                onTap: () {
                  widget.startFlickering();
                  widget.changeMenu(1);
                  _controller.animateTo(-0.165);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/leftWhite.svg'
                        : 'images/leftb.svg',
                    width: 1,
                    height: 224,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 251,
              left: 72,
              child: GestureDetector(
                onTap: () {
                  widget.startFlickering();
                  widget.changeMenu(0);
                  _controller.animateTo(-0.33);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 0
                        ? 'images/leftDownWhite.svg'
                        : 'images/leftDown.svg',
                    width: 1,
                    height: 185,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 76,
              right: 52,
              child: GestureDetector(
                onTap: () {
                  widget.startFlickering();
                  widget.changeMenu(3);
                  _controller.animateTo(0.1755);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/revpand8.svg'
                        : 'images/revpand7.svg',
                    width: 1,
                    height: 183,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 213,
              right: 4,
              child: GestureDetector(
                onTap: () {
                  widget.startFlickering();
                  widget.changeMenu(4);

                  _controller.animateTo(0.337);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/rightdownwhite1.svg'
                        : 'images/rightdownb.svg',
                    width: 190,
                    height: 223.5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: top,
              right: 191,
              child: Container(
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Container(
                    height: 265.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/red1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // BLINKING TEXT
            Positioned(
              bottom: 135,
              right: 198,
              child: AnimatedBuilder(
                animation: _blinkAnimation,
                builder: (context, child) {
                  return Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Click to\n',
                          style: TextStyle(
                            color: _blinkAnimation.value,
                            fontFamily: 'ralewaymedium',
                            fontSize: 25,
                          ),
                        ),
                        TextSpan(
                          text: 'NAVIGATE',
                          style: TextStyle(
                            color: _blinkAnimation.value,
                            fontFamily: 'ralewaybold',
                            fontSize: 28,
                            height: 0.8,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
