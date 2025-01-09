import 'package:flutter/material.dart';

class PageChangeButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const PageChangeButton(
      {super.key, required this.text, required this.onPressed});

  @override
  _PageChangeButtonState createState() => _PageChangeButtonState();
}

class _PageChangeButtonState extends State<PageChangeButton> {
  bool _isSelected = false;

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        _toggleSelection();
        widget.onPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          _isSelected
              ? Colors.white.withOpacity(0.45)
              : Colors.white.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: widthDevice < 1500 ? 20 : 27.2,
          fontFamily: 'Koulen',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
