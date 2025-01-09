import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class IconSearchBox extends StatefulWidget {
  final Function(String) onChanged;
  const IconSearchBox({super.key, required this.onChanged});

  @override
  State<IconSearchBox> createState() => _IconSearchBoxState();
}

class _IconSearchBoxState extends State<IconSearchBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Container(
        width: MyUtility(context).width * 0.2,
        height: MyUtility(context).height * 0.065,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x7F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('images/searchicon.svg')),
            Expanded(
              child: TextField(
                onChanged: (value) {
                  widget.onChanged(value);
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    color: Color(0xFF516664),
                    fontSize: 16.32,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
