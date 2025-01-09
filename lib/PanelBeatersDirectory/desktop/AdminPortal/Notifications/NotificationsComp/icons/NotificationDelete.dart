import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/confirmDialog.dart';

class NotificationDelete extends StatefulWidget {
  final Function onSelected;
  final Color iconColor;
  const NotificationDelete(
      {super.key, required this.iconColor, required this.onSelected});

  @override
  State<NotificationDelete> createState() => _NotificationDeleteState();
}

class _NotificationDeleteState extends State<NotificationDelete> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Delete',
      preferBelow: false,
      child: IconButton(
        onPressed: () => widget.onSelected(),
        icon: Icon(
          Icons.delete,
          color: widget.iconColor,
          size: 23.0,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
