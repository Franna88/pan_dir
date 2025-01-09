import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor; // Optional parameter for text color
  final double? width; // Optional parameter for custom width
  bool? waiting;

  AddButton({
    Key? key,
    this.waiting,
    required this.text,
    required this.onPressed,
    this.textColor, // Default is null if not provided
    this.width, // Default is null if not provided
  }) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
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
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              width: widget.width ??
                  null, // Use custom width if provided, else default to null
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              child: widget.waiting != null
                  ? widget.waiting!
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          widget.text,
                          style: TextStyle(
                            color: widget.textColor ??
                                Colors
                                    .white, // Default to white if no color is specified
                            fontSize: 14.24,
                            fontFamily: 'ralewaymedium',
                          ),
                          textAlign: TextAlign.center,
                        )
                  : Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.textColor ??
                            Colors
                                .white, // Default to white if no color is specified
                        fontSize: 14.24,
                        fontFamily: 'ralewaymedium',
                      ),
                      textAlign: TextAlign.center,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
