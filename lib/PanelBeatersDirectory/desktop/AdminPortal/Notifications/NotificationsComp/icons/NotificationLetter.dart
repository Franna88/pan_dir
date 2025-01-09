import 'package:flutter/material.dart';

class NotificationLetter extends StatefulWidget {
  final VoidCallback onPress;
  final Color iconColor;

  const NotificationLetter({
    super.key,
    required this.iconColor,
    required this.onPress,
  });

  @override
  State<NotificationLetter> createState() => _NotificationLetterState();
}

class _NotificationLetterState extends State<NotificationLetter> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Open',
      preferBelow: false,
      child: IconButton(
        onPressed: () {
          widget.onPress();
          setState(() {});
        },
        icon: Icon(
          Icons.email,
          color: widget.iconColor,
          size: 23.0,
        ),
        padding: EdgeInsets.zero, // Use EdgeInsets.zero for zero padding
      ),
    );
  }
}
