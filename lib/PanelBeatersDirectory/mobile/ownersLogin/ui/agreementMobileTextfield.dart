import 'package:flutter/material.dart';

class AgreementMobileTextField extends StatelessWidget {
  String hintText;
  double width;
  AgreementMobileTextField(
      {super.key, required this.hintText, required this.width});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          width: width,
          height: 35,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 3, bottom: 15, left: 20, right: 20),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 124, 124, 124),
                fontSize: 16,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
