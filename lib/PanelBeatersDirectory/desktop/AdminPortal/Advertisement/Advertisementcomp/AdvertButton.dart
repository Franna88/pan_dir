import 'package:flutter/material.dart';

class AdvertButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AdvertButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AdvertButtonState createState() => _AdvertButtonState();
}

class _AdvertButtonState extends State<AdvertButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xFFEF9040),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x7F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Text(
              widget.text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.76,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
