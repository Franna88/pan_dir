import 'package:flutter/material.dart';

class SmallTextBox extends StatelessWidget {
  String keyText;
  String hintText;
  TextEditingController textController;
  SmallTextBox(
      {super.key,
      required this.hintText,
      required this.keyText,
      required this.textController});

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
                        fontSize: 16,
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
                child: TextField(
                  controller: textController,
                  style: TextStyle(
                    fontSize: heightDevice < 710 ? 12 : 16,
                    fontFamily: 'raleway',
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        bottom: heightDevice < 710 ? 15 : 14,
                        left: 15,
                        right: 15),
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 124, 124, 124),
                      fontSize: heightDevice < 710 ? 12 : 16,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            ],
          )
        :
        //-------------
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
                width: widthDevice * 0.11,
                height: 45,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.99, color: Color(0xFFEAEBEC)),
                    borderRadius: BorderRadius.circular(15.90),
                  ),
                ),
                child: TextField(
                  controller: textController,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        top: 13, bottom: 13, left: 20, right: 20),
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 124, 124, 124),
                      fontSize: 18,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
