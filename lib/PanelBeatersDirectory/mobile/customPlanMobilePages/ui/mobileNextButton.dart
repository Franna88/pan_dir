import 'package:flutter/material.dart';

class MobileNextButton extends StatefulWidget {
  Function onPressed;
  String buttonText;
  MobileNextButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  State<MobileNextButton> createState() => _MobileNextButtonState();
}

class _MobileNextButtonState extends State<MobileNextButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          /*width: MediaQuery.of(context).size.width * 0.08,*/
          /*height: MediaQuery.of(context).size.height * 0.05,*/
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                isPressed = !isPressed;
                widget.onPressed();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isPressed ? Colors.black : Color(0xFFE2822B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.zero,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 4, bottom: 4, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: isPressed ? Colors.white : Colors.black,
                      fontSize: 14,
                      fontFamily: 'raleway',
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.east,
                    color: isPressed ? Colors.white : Colors.black,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
