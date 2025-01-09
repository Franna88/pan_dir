import 'package:flutter/material.dart';

class LabelImportant extends StatefulWidget {
  final Color iconColorChange;
  final Color iconColor;
  const LabelImportant(
      {super.key, required this.iconColor, required this.iconColorChange});

  @override
  State<LabelImportant> createState() => _LabelImportantState();
}

class _LabelImportantState extends State<LabelImportant> {
  bool _isImportant = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _isImportant ? 'Important' : 'Mark as important',
      preferBelow: false,
      child: IconButton(
        onPressed: () {
          setState(() {
            _isImportant = !_isImportant;
          });
        },
        icon: Icon(
          _isImportant ? Icons.label_important : Icons.label_important_outline,
          color: _isImportant ? widget.iconColorChange : widget.iconColor,
          size: 25.0,
        ),
        padding: EdgeInsets.all(0),
      ),
    );
  }
}
