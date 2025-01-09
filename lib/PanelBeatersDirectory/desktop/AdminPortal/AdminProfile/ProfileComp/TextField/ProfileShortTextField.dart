import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileShortTextField extends StatefulWidget {
  final TextEditingController controller;
  final String headline;

  const ProfileShortTextField({
    Key? key,
    required this.controller,
    required this.headline,
  }) : super(key: key);

  @override
  State<ProfileShortTextField> createState() => _ProfileShortTextFieldState();
}

class _ProfileShortTextFieldState extends State<ProfileShortTextField> {
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
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: MyUtility(context).width * 0.242,
            height: MyUtility(context).height * 0.045,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                controller: widget.controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 12),
                ),
                style: TextStyle(
                  fontSize: 14.7364,
                  fontFamily: 'raleway',
                  color: Color(0xFF5F6368),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
