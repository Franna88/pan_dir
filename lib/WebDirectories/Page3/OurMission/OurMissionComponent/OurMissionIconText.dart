import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class OurMissionIconText extends StatefulWidget {
  final String text;
  const OurMissionIconText({Key? key, required this.text}) : super(key: key);

  @override
  State<OurMissionIconText> createState() => _OurMissionIconTextState();
}

class _OurMissionIconTextState extends State<OurMissionIconText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: SizedBox(
        width: MyUtility(context).width / 5.5,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF292556),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'images/circlecheck.svg',
                  width: 25,
                  height: 25,
                  color: Color(0xFF65DAFF),
                ),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontFamily: 'raleway',
                  fontSize: 14,
                  color: Color(0xFFFBFBFB),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
