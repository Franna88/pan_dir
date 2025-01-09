import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class TextfieldButton extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  const TextfieldButton({super.key, required this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.2,
      height: 38,
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
          // Padding(
          //   padding: const EdgeInsets.only(left: 10),
          //   child: Container(
          //       width: 25,
          //       height: 25,
          //       decoration: BoxDecoration(
          //         color: Colors.black,
          //         shape: BoxShape.circle,
          //       ),
          //       padding: EdgeInsets.zero,
          //       child: Icon(
          //         Icons.keyboard_arrow_right_outlined,
          //         color: Colors.white,
          //         size: 16,
          //       ),
          //     ),
          // ),
          SizedBox(width: 6),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'ralewaysemi',
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
