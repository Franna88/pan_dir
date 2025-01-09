import 'package:flutter/material.dart';

import '../../../components/myutility.dart';

class AccountTextField extends StatefulWidget {
  final double length;
  final Color textColor;
  const AccountTextField(
      {super.key, required this.length, required this.textColor});

  @override
  State<AccountTextField> createState() => _AccountTextFieldState();
}

class _AccountTextFieldState extends State<AccountTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 3.71,
            offset: Offset(0, 3.71),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: widget.textColor,
          fontSize: 14.73,
          fontFamily: 'ralewaysemi',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
        ),
      ),
    );
  }
}
