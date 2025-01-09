import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class AdvertEdit extends StatefulWidget {
  final String icon;
  final VoidCallback onPress;

  const AdvertEdit({Key? key, required this.icon, required this.onPress})
      : super(key: key);

  @override
  State<AdvertEdit> createState() => _AdvertEditState();
}

class _AdvertEditState extends State<AdvertEdit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 12),
      child: GestureDetector(
        onTap: widget.onPress,
        child: Container(
          width: MyUtility(context).width * 0.025,
          height: MyUtility(context).height * 0.04,
          decoration: ShapeDecoration(
            color: Color(0xFFEF9040),
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
