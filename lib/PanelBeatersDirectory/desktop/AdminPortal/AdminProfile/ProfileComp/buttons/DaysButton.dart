import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DaysButton extends StatefulWidget {
  final String day;
  bool isSelected;
  DaysButton({super.key, required this.day, required this.isSelected});

  @override
  State<DaysButton> createState() => _DaysButtonState();
}

class _DaysButtonState extends State<DaysButton> {
  void _toggleSelected() {
    setState(() {
      widget.isSelected = !widget.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7.5, bottom: 15),
      child: GestureDetector(
        onTap: _toggleSelected,
        child: Container(
          width: MyUtility(context).width * 0.035,
          height: MyUtility(context).height * 0.065,
          decoration: ShapeDecoration(
            color: widget.isSelected ? Color(0xFF0F253A) : Color(0xFFB2BAC6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              widget.day,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21.76,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
