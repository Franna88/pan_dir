import 'package:flutter/material.dart';

class NotificationStar extends StatefulWidget {
  final ValueChanged<bool> onStarChanged;
  final Color iconColorChange;
  final Color iconColor;

  const NotificationStar(
      {super.key,
      required this.onStarChanged,
      required this.iconColor,
      required this.iconColorChange});

  @override
  State<NotificationStar> createState() => _NotificationStarState();
}

class _NotificationStarState extends State<NotificationStar> {
  bool _isStarred = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _isStarred ? 'Unstar' : 'Star', // Tooltip text
      preferBelow: false, // Tooltip appears above the icon
      child: IconButton(
        onPressed: () {
          setState(() {
            _isStarred = !_isStarred;
            widget.onStarChanged(_isStarred); // Notify parent about the change
          });
        },
        icon: Icon(
          _isStarred ? Icons.star : Icons.star_border,
          color: _isStarred ? Color(0xFFEF9040) : widget.iconColor,
          size: 25.0,
        ),
      ),
    );
  }
}
