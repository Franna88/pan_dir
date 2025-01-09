import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';

class MediumTextBox extends StatelessWidget {
  String keyText;
  String hintText;
  TextEditingController? controller;
  final String? Function(String?)? validator;

  MediumTextBox(
      {super.key,
      required this.hintText,
      required this.keyText,
      this.validator,
      this.controller});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    return widthDevice < 1500
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: keyText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: heightDevice < 710 ? 12 : 14,
                        fontFamily: 'raleway',

                        //height: 0.06,
                      ),
                    ),
                    TextSpan(
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
              SizedBox(
                height: heightDevice < 710 ? 3 : 5,
              ),
              Container(
                width: widthDevice * 0.30,
                height: heightDevice < 710 ? 35 : 43,
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
                  style: TextStyle(
                    fontSize: heightDevice < 710 ? 15 : 17,
                    fontFamily: 'raleway',
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorStyle: const TextStyle(color: Color(0xFFEF9040)),
                  ),
                ),
              ),
            ],
          )
        :
        //----------------
        //BIGGER SCREEN
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: keyText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'raleway',

                        //height: 0.06,
                      ),
                    ),
                    TextSpan(
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
              SizedBox(
                height: 5,
              ),
              Container(
                width: widthDevice * 0.24,
                height: 90,
                // decoration: ShapeDecoration(
                //   color: Colors.white,
                //   shape: RoundedRectangleBorder(
                //     side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
                //     borderRadius: BorderRadius.circular(15.90),
                //   ),
                // ),
                child: TextFormField(
                  validator: validator,
                  controller: controller,
                  style: TextStyle(
                    fontSize: heightDevice < 710 ? 14 : 16,
                    fontFamily: 'raleway',
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.90),
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
