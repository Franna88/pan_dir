import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  final Color iconColor;
  final IconData icon; // Add the icon as a parameter

  const NotificationButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
    required this.iconColor,
    required this.icon, // Initialize the icon parameter
  }) : super(key: key);

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(),
      child: Row(
        children: [
          Icon(
            widget.icon, // Use the passed icon
            color: widget.iconColor,
            size: 25.0,
          ),
          TextButton(
            onPressed: widget.onPressed,
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.iconColor,
                fontSize: widthDevice < 1500 ? 18 : 17.54,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
