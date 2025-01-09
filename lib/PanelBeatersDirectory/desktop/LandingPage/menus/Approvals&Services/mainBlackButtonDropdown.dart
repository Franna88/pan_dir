import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainBlackButtonDropdown extends StatelessWidget {
  final String buttonTitle;
  final Widget customScrollDropdownContent;
  final Function() onToggle;
  final bool isOpen;
  const MainBlackButtonDropdown(
      {super.key,
      required this.buttonTitle,
      required this.customScrollDropdownContent,
      required this.isOpen,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
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
              gradient: const LinearGradient(
                begin: Alignment(-1, 0.00),
                end: Alignment(1, 0),
                colors: [
                  Color(0xFF181B1D),
                  Color(0xFF181B1D),
                ],
              ),
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
                  style: widthDevice < 1500
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'ralewaymedium',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          height: 0,
                        )
                      : TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'ralewaymedium',
                          fontWeight: FontWeight.w600,
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
              children: [customScrollDropdownContent],
            ),
          ),
      ],
    );
  }
}
