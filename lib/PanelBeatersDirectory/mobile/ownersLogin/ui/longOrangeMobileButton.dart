import 'package:flutter/material.dart';

class LongOrangeMobileButton extends StatefulWidget {
  String buttonText;
  Function onPressed;
  double widthButton;
  bool? isLoading;
  LongOrangeMobileButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.widthButton,
      this.isLoading});

  @override
  State<LongOrangeMobileButton> createState() => _LongOrangeMobileButtonState();
}

class _LongOrangeMobileButtonState extends State<LongOrangeMobileButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event here
        widget.onPressed();
      },
      child: Container(
        width: widget.widthButton,
        height: 40,
        padding: const EdgeInsets.only(top: 4),
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.64,
                  fontFamily: 'ralewaybold',
                ),
              ),
              const SizedBox(width: 10.60),
              SizedBox(
                width: 25,
                height: 25,
                child: widget.isLoading == true || widget.isLoading == null
                    ? null
                    : const Icon(Icons.east),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
