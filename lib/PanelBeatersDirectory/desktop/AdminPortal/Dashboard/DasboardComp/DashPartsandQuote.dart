import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class Dashpartsandquote extends StatefulWidget {
  final String containerText;
  final String containerNumber;
  final String svgImage;
  final String? customText;
  const Dashpartsandquote(
      {super.key,
      required this.containerText,
      required this.containerNumber,
      required this.svgImage,
      this.customText});

  @override
  State<Dashpartsandquote> createState() => _DashpartsandquoteState();
}

class _DashpartsandquoteState extends State<Dashpartsandquote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.165,
      height: MyUtility(context).height * 0.125,
      decoration: ShapeDecoration(
        color: Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.71),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          // Center content with icon and main text
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    widget.svgImage,
                    width: 40.0,
                    height: 40.0,
                  ),
                  SizedBox(width: 8.0), // Space between icon and text
                  Text(
                    widget.containerText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.6,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Orange text in the bottom-right corner
          Positioned(
            bottom: 12.0,
            right: 12.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.containerNumber,
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: 20.7264,
                    fontFamily: 'ralewaysemi',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.customText != null
                      ? widget.customText!
                      : 'New Requests',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: 10.2,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
