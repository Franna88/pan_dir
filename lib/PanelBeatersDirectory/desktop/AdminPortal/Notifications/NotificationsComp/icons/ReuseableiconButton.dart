import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseableIconButton extends StatefulWidget {
  final IconData icon;
  final double size;
  final Color iconColor;
  final String tooltipMessage;
  final VoidCallback onPressed;

  const ReuseableIconButton({
    Key? key,
    required this.icon,
    required this.size,
    required this.iconColor,
    required this.tooltipMessage,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ReuseableIconButton> createState() => _ReuseableIconButtonState();
}

class _ReuseableIconButtonState extends State<ReuseableIconButton> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltipMessage,
      preferBelow: false,
      child: IconButton(
        onPressed: widget.onPressed,
        icon: Icon(
          widget.icon,
          color: widget.iconColor,
          size: widget.size,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
