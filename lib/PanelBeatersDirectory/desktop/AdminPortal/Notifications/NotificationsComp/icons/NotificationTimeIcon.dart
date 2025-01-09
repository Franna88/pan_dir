import 'package:flutter/material.dart';

class NotificationTimeIcon extends StatefulWidget {
  final Color iconColor;
  const NotificationTimeIcon({super.key, required this.iconColor});

  @override
  State<NotificationTimeIcon> createState() => _NotificationTimeIconState();
}

class _NotificationTimeIconState extends State<NotificationTimeIcon> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Time',
      preferBelow: false,
      child: IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: Icon(
          Icons.access_time_filled,
          color: widget.iconColor,
          size: 23.0,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
