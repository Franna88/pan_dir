import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AccountShortTextField extends StatefulWidget {
  final String descriptionText;
  const AccountShortTextField({super.key, required this.descriptionText});

  @override
  State<AccountShortTextField> createState() => _AccountShortTextFieldState();
}

class _AccountShortTextFieldState extends State<AccountShortTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.18,
          child: Text(
            widget.descriptionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.17,
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
              color: Color(0xFFFF8728),
              fontSize: 14.73,
              fontFamily: 'ralewaysemi',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        )
      ],
    );
  }
}
