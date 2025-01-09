import 'package:flutter/material.dart';

class MainButtonDark extends StatelessWidget {
  String buttonTitle;
  final Widget dropdownContent;
  final Function() onToggle;
  final bool isOpen;
  MainButtonDark(
      {super.key,
      required this.buttonTitle,
      required this.dropdownContent,
      required this.isOpen,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            width: 600,
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.only(
              top: 5,
              left: 20,
              right: 8,
              bottom: 5,
            ),
            decoration: ShapeDecoration(
              color: Colors.black,
              
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Colors.white),
                borderRadius: BorderRadius.circular(37.99),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  buttonTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    height: 0,
                  ),
                ),
                Container(
                  width: 35,
                  height: 35,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isOpen)
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [dropdownContent],
            ),
          ),
      ],
    );
  }
}
