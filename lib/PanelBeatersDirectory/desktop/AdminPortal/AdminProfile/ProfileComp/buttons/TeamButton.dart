import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class TeamButton extends StatefulWidget {
  final String icon;
  final VoidCallback onPress;

  const TeamButton({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  @override
  State<TeamButton> createState() => _TeamButtonState();
}

class _TeamButtonState extends State<TeamButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          width: MyUtility(context).width * 0.025,
          height: MyUtility(context).height * 0.05,
          decoration: ShapeDecoration(
            color: Color(0xFF0F253A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(widget.icon),
          ),
        ),
      ),
    );
  }
}
