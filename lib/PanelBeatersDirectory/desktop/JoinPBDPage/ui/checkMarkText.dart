import 'package:flutter/material.dart';

class CheckMarkText extends StatelessWidget {
  String text;
  CheckMarkText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice > 1290
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  width: widthDevice / 25,
                  height: heightDevice / 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: heightDevice / 50,
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice / 74,
                      fontFamily: 'raleway',
                      letterSpacing: 0.5),
                )
              ],
            ),
          )

        //SMALLER SCREENS
        : Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  width: heightDevice < 710 ? 20 : 25,
                  height: heightDevice < 710 ? 20 : 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: Icon(
                    Icons.check,
                    color: Colors.black,
                    size: heightDevice < 710 ? 12 : 14,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: heightDevice < 710 ? 16 : 18,
                      fontFamily: 'raleway',
                      letterSpacing: 0.5),
                )
              ],
            ),
          );
  }
}
