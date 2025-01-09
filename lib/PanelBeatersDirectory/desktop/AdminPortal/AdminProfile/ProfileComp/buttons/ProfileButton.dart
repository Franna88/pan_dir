import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const ProfileButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.transparent,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: widthDevice < 1500 ? 18 : 17.64,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
