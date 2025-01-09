import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  String buttonText;
  Function onPressed;

  NextButton({super.key, required this.onPressed, required this.buttonText});

  @override
  State<NextButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<NextButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            /*width: MediaQuery.of(context).size.width * 0.08,*/
            /*height: MediaQuery.of(context).size.height * 0.05,*/
            child: ElevatedButton(
              onPressed: () {
                widget.onPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isHovered ? Colors.black : Color(0xFFE2822B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.buttonText,
                      style: TextStyle(
                        color: isHovered ? Colors.white : Colors.black,
                        fontSize: 18,
                        fontFamily: 'ralewaymedium',
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.east,
                      color: isHovered ? Colors.white : Colors.black,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
