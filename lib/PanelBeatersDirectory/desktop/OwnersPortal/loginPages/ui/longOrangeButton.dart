import 'package:flutter/material.dart';

class LongOrangeButton extends StatefulWidget {
  dynamic buttonText;
  Function onPressed;
  bool? isLoading;
  LongOrangeButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.isLoading});

  @override
  State<LongOrangeButton> createState() => _OrangeButtonState();
}

class _OrangeButtonState extends State<LongOrangeButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice < 1500
        ? GestureDetector(
            onTap: () {
              widget.onPressed();
            },
            child: Container(
              width: widthDevice * 0.30,
              height: heightDevice < 710 ? 28 : 35,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: Color(0xFFE2822B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(230),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.buttonText is String
                      ? Text(
                          widget.buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: heightDevice < 710 ? 14 : 16,
                            fontFamily: 'ralewaymedium',
                          ),
                        )
                      : widget.buttonText,
                  const SizedBox(width: 10.60),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: widget.isLoading == true
                        ? null
                        : const Icon(Icons.east),
                  ),
                ],
              ),
            ),
          )
        //---------------
        //BIGGER SCREEN
        : GestureDetector(
            onTap: () {
              widget.onPressed();
            },
            child: Container(
              width: widthDevice * 0.24,
              height: 40,
              padding: const EdgeInsets.all(5),
              decoration: ShapeDecoration(
                color: Color(0xFFE2822B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(230),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.buttonText is String
                      ? Text(
                          widget.buttonText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: heightDevice < 710 ? 14 : 16,
                            fontFamily: 'ralewaymedium',
                          ),
                        )
                      : widget.buttonText,
                  const SizedBox(width: 10.60),
                  SizedBox(
                    width: 25,
                    height: 25,
                    child: widget.isLoading == true
                        ? null
                        : const Icon(Icons.east),
                  ),
                ],
              ),
            ),
          );
  }
}
