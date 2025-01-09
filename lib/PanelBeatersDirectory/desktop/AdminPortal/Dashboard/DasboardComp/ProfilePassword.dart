import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfilePassword extends StatefulWidget {
  final String descriptionText;
  final double length;
  const ProfilePassword(
      {super.key, required this.descriptionText, required this.length});

  @override
  State<ProfilePassword> createState() => _ProfilePasswordState();
}

class _ProfilePasswordState extends State<ProfilePassword> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.18,
          height: MyUtility(context).height * 0.035,
          child: Text(
            widget.descriptionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * widget.length,
          height: MyUtility(context).height * 0.05,
          padding: const EdgeInsets.only(
            top: 0,
            left: 8.79,
            bottom: 15,
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.22),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3.71,
                offset: Offset(0, 3.71),
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextField(
            obscureText: _obscureText,
            style: const TextStyle(
              color: Color(0xFF5F6368),
              fontSize: 14.73,
              fontFamily: 'raleway',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Color(0xFF5F6368),
                ),
                onPressed: _toggleVisibility,
              ),
            ),
          ),
        )
      ],
    );
  }
}
