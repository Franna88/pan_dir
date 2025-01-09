import 'package:flutter/material.dart';

class IndustryAddButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const IndustryAddButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _IndustryAddButtonState createState() => _IndustryAddButtonState();
}

class _IndustryAddButtonState extends State<IndustryAddButton> {
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
        child: Center(
          child: InkWell(
            onTap: widget.onPressed,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xFFFF8728),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.5),
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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.9692,
                  fontFamily: 'raleway',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
