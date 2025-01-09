import 'package:flutter/material.dart';

class Selectall extends StatefulWidget {
  final Function(bool?) onSelected;
  const Selectall({super.key, required this.onSelected});

  @override
  State<Selectall> createState() => _SelectallState();
}

class _SelectallState extends State<Selectall> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Select All', // Tooltip text
      preferBelow: false, // Tooltip appears above the checkbox
      child: Checkbox(
        value: _isSelected,
        onChanged: (bool? value) {
          setState(() {
            _isSelected = value ?? false;
          });
          widget.onSelected(value);
        },
        activeColor: Colors.transparent, // Remove default active color
        checkColor: Color(0xFFEF9040), // Inside color when selected
        side: MaterialStateBorderSide.resolveWith(
          (states) => BorderSide(
            color: Color(0xFF757575), // Border color of the checkbox
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
