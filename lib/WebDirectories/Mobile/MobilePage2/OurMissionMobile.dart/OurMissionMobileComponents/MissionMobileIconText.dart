import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class MissionMobileIconText extends StatefulWidget {
  final String text;
  const MissionMobileIconText({Key? key, required this.text}) : super(key: key);

  @override
  State<MissionMobileIconText> createState() => _MissionMobileIconTextState();
}

class _MissionMobileIconTextState extends State<MissionMobileIconText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF292556),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'images/circlecheck.svg',
                  width: 24,
                  height: 24,
                  color: Color(0xFF65DAFF),
                ),
              ),
            ),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFFBFBFB),
                  fontFamily: 'raleway',
                  height: 1.1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
