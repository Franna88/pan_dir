import 'package:flutter/material.dart';

class NotificationRefresh extends StatefulWidget {
  final Function refresh;
  const NotificationRefresh({super.key, required this.refresh});

  @override
  State<NotificationRefresh> createState() => _NotificationRefreshState();
}

class _NotificationRefreshState extends State<NotificationRefresh> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Refresh',
      preferBelow: false,
      child: IconButton(
        onPressed: () {
          widget.refresh();
        },
        icon: Icon(
          Icons.refresh,
          color: Color(0xFF757575),
          size: 25.0,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
