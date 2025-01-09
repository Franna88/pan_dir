import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class IconSearchBoxB extends StatefulWidget {
  TextEditingController search;
  final Function(String?)? onSearch;
  IconSearchBoxB({super.key, required this.search, this.onSearch});

  @override
  State<IconSearchBoxB> createState() => _IconSearchBoxBState();
}

class _IconSearchBoxBState extends State<IconSearchBoxB> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MyUtility(context).width * 0.2,
        height: MyUtility(context).height * 0.055,
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
              child: SvgPicture.asset(
                'images/searchicon.svg',
                color: Color(0xFF0F253A), // Correct color assignment
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: (String? value) {
                  if (widget.onSearch != null) {
                    widget.onSearch!(value);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Search here...',
                  hintStyle: TextStyle(
                    color: Color(0xFF516664),
                    fontSize: 16.32,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w400,
                    height: 0,
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
