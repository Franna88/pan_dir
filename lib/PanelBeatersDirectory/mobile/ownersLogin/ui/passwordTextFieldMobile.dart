import 'package:flutter/material.dart';

class PasswordTextFieldMobile extends StatefulWidget {
  double widthContainer;
  String hintText;
  String keyText;
  TextEditingController? controller;
  String? Function(String?)? validator;

  PasswordTextFieldMobile(
      {super.key,
      required this.hintText,
      required this.keyText,
      required this.widthContainer,
      this.validator,
      this.controller});

  @override
  _PasswordTextFieldMobileState createState() =>
      _PasswordTextFieldMobileState();
}

class _PasswordTextFieldMobileState extends State<PasswordTextFieldMobile> {
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: widget.keyText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
          width: widget.widthContainer, //450 //215
          height: 90,
          // decoration: ShapeDecoration(
          //   color: Colors.white,
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          // ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(
                  color: Colors.black, fontSize: 15.64, fontFamily: 'raleway'),
              obscureText: _obscured,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(top: 13, bottom: 15, left: 20, right: 20),
                hintStyle: TextStyle(
                  color: const Color.fromARGB(255, 124, 124, 124),
                  fontSize: 16,
                  fontFamily: 'raleway',
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: widget.hintText,
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  child: GestureDetector(
                    onTap: _toggleObscured,
                    child: Icon(
                      _obscured
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      size: 20,
                      color: const Color.fromARGB(255, 124, 124, 124),
                    ),
                  ),
                ),
                errorStyle: const TextStyle(color: Color(0xFFEF9040)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
