import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class LongFormFieldMobile extends StatefulWidget {
  final String reviewInfo;

  const LongFormFieldMobile({Key? key, required this.reviewInfo})
      : super(key: key);

  @override
  State<LongFormFieldMobile> createState() => _LongFormFieldMobileState();
}

class _LongFormFieldMobileState extends State<LongFormFieldMobile> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.8,
      height: MyUtility(context).height * 0.046,
      decoration: ShapeDecoration(
        color: Color(0x00D9D9D9),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          controller: _controller,
          textAlignVertical: TextAlignVertical.top,
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 13.022,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            hintText: widget.reviewInfo,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13.022,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(top: -15.0),
          ),
        ),
      ),
    );
  }
}
