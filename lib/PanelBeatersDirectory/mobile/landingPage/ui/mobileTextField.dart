import 'package:flutter/material.dart';

class MobileTextfield extends StatelessWidget {
  final String hintText;
  const MobileTextfield({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: widthDevice * 0.65,
      height: 35,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 246, 246),
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          /*BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),*/
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 14.7,
                  fontFamily: 'raleway',
                  color: Color(0xFF0E1013),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
