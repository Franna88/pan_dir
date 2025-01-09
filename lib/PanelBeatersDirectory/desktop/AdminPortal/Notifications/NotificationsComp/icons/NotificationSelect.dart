import 'package:flutter/material.dart';

class NotificationSelect extends StatefulWidget {
  final Color boxColor;
  bool isSelected;
  final Function(bool?) onSelected;
  NotificationSelect(
      {super.key,
      required this.boxColor,
      required this.isSelected,
      required this.onSelected});

  @override
  State<NotificationSelect> createState() => _NotificationSelectState();
}

class _NotificationSelectState extends State<NotificationSelect> {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Select', // Tooltip text
      preferBelow: false, // Tooltip appears above the checkbox
      child: Checkbox(
        value: widget.isSelected,
        onChanged: (bool? value) {
          widget.onSelected(value);
        },
        activeColor: widget.isSelected
            ? Colors.white
            : Colors.transparent, // Remove default active color
        checkColor: Color(0xFFEF9040), // Inside color when selected
        side: WidgetStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: widget.boxColor, // Border color of the checkbox
            width: 2.0, // Border width
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0), // Square shape
        ),
      ),
    );
  }
}
