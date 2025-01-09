import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileTextField extends StatefulWidget {
  final TextEditingController controller;
  final String headline;
  final Color? customColor;
  final double? customWidth;

  const ProfileTextField(
      {Key? key,
      required this.controller,
      required this.headline,
      this.customColor,
      this.customWidth})
      : super(key: key);

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headline,
            style: TextStyle(
              color: widget.customColor != null
                  ? widget.customColor
                  : Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
              height: 1,
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: widget.customWidth != null
                ? widget.customWidth
                : MyUtility(context).width * 0.5,
            height: MyUtility(context).height * 0.045,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Value is required';
                    }
                    return null;
                  },
                  cursorColor: Colors.black,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 10),
                  ),
                  style: TextStyle(
                    color: Color(0xFF5F6368),
                    fontSize: 14.7364,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
