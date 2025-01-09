import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

import '../ui/mobileCategoryText.dart';

class MobileCategorySelect extends StatefulWidget {
  int menuIndex;
  Function(int) changeMenu;
  MobileCategorySelect(
      {super.key, required this.menuIndex, required this.changeMenu});

  @override
  State<MobileCategorySelect> createState() => _MobileCategorySelectState();
}

class _MobileCategorySelectState extends State<MobileCategorySelect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double top = 145;
  double right = 185;
  @override
  void initState() {
    //animation start
    _controller = AnimationController(
      lowerBound: -0.6,
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller.animateTo(-0.32);
    super.initState();
  }

  @override
  void dispose() {
    //end animation
    _controller.dispose();

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
              width: 400,
              height: 400,
            ),
            Positioned(
              top: 8,
              left: 0,
              right: 0,
              child: Container(
                child: SvgPicture.asset(
                  'images/gauge.svg',
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            Positioned(
              top: 181.5,
              left: 0,
              right: 175,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(0);
                  _controller.animateTo(-0.32);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 0
                        ? 'images/cloud2.svg'
                        : 'images/cloud1.svg',
                    width: 1,
                    height: 123,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 16,
              right: 8.5,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(2);
                  _controller.animateTo(0.0);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 2
                        ? 'images/car2.svg'
                        : 'images/car1.svg',
                    width: 1,
                    height: 90,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 62,
              left: 18,
              right: 189,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(1);
                  _controller.animateTo(-0.16);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 1
                        ? 'images/local2.svg'
                        : 'images/local1.svg',
                    width: 1,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 64,
              left: 174.5,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(3);
                  _controller.animateTo(0.17);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 3
                        ? 'images/stack2.svg'
                        : 'images/stack1.svg',
                    width: 1,
                    height: 122,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 185,
              left: 174,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  widget.changeMenu(4);

                  _controller.animateTo(0.325);
                },
                child: Container(
                  child: SvgPicture.asset(
                    widget.menuIndex == 4
                        ? 'images/tow2.svg'
                        : 'images/tow1.svg',
                    width: 1,
                    height: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 95,
                
              left: width > 400 ? width * 0.28 :  width * 0.27,
              child: Container(
                child: RotationTransition(
                  alignment: Alignment.center,
                  turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  child: Container(
                    height: 180.0,
                    width: 170.0,
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
            if (widget.menuIndex == 0)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Mobilecategorytext(
                  text1: 'Download',
                  text2: 'WATIF',
                ),
              )
            else if (widget.menuIndex == 1)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Mobilecategorytext(
                  text1: 'Body Shop',
                  text2: 'NEAR ME',
                ),
              )
            else if (widget.menuIndex == 2)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Mobilecategorytext(
                  text1: 'Panel Shop',
                  text2: 'SERVICES',
                ),
              )
            else if (widget.menuIndex == 3)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Mobilecategorytext(
                  text1: 'Info &',
                  text2: 'Finance',
                ),
              )
            else if (widget.menuIndex == 4)
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Mobilecategorytext(
                  text1: 'More',
                  text2: 'SERVICES  ',
                ),
              ),
          ],
        ),
      ],
    );
  }
}
