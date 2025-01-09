import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final double widthContainer;
  final String hintText;
  final String keyText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PasswordField(
      {super.key,
      required this.hintText,
      required this.keyText,
      required this.widthContainer,
      this.validator,
      this.controller});

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

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
                      text: widget.keyText,
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
                        fontSize: 18,
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
                width: widthDevice * 0.14,

                height: heightDevice < 710 ? 35 : 43,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextFormField(
                  validator: widget.validator,
                  controller: widget.controller,
                  style: TextStyle(
                    fontSize: heightDevice < 710 ? 15 : 17,
                    fontFamily: 'raleway',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(bottom: 15, left: 15, right: 15),
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 124, 124, 124),
                      fontSize: heightDevice < 710 ? 12 : 16,
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
                  ),
                ),
              ),
            ],
          )
        :
        //------------------
        //BIGGER SCREEN
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: widget.keyText,
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
                        fontSize: 18,
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
                //     borderRadius: BorderRadius.circular(15.90),
                //   ),
                // ),
                child: TextFormField(
                  controller: widget.controller,
                  validator: widget.validator,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _obscured,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 13, bottom: 13, left: 20, right: 20),
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 124, 124, 124),
                      fontSize: 18,
                      fontFamily: 'raleway',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: widget.hintText,
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15.90),
                    ),
                    errorStyle: TextStyle(color: Color(0xFFEF9040)),
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
                  ),
                ),
              ),
            ],
          );
  }
}
