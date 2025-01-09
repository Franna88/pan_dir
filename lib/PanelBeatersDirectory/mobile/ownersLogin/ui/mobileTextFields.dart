import 'package:flutter/material.dart';

class MobileTextFields extends StatelessWidget {
  String keyText;
  String hintText;
  double widthContainer;
  TextEditingController? controller;
  String? Function(String?)? validator;
  MobileTextFields(
      {super.key,
      required this.hintText,
      required this.keyText,
      required this.widthContainer,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: keyText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',

                  //height: 0.06,
                ),
              ),
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Color(0xFFEF9040),
                  fontSize: 20,
                  fontFamily: 'raleway',

                  //height: 0.06,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: widthContainer,
          height: 90,
          // decoration: ShapeDecoration(
          //   color: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          // ),
          child: TextFormField(
            validator: validator,
            controller: controller,
            cursorColor: Colors.black,
            style: const TextStyle(
                color: Colors.black, fontSize: 15.64, fontFamily: 'raleway'),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                  top: 13, bottom: 15, left: 20, right: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 124, 124, 124),
                fontSize: 15.64,
                fontFamily: 'raleway',
              ),
              filled: true,
              fillColor: Colors.white,
              errorStyle: const TextStyle(color: Color(0xFFEF9040)),
            ),
          ),
        ),
      ],
    );
  }
}
