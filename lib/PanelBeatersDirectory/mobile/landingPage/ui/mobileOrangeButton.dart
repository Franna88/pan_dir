import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MobileOrangeButton extends StatelessWidget {
  final String buttonTitle;
  final Widget dropdownContent;
  final Function() onToggle;
  final bool isOpen;
  const MobileOrangeButton(
      {super.key,
      required this.buttonTitle,
      required this.dropdownContent,
      required this.isOpen,
      required this.onToggle});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: onToggle,
          child: Container(
            width: widthDevice * 0.85,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(
              top: 5,
              left: 15,
              right: 8,
              bottom: 5,
            ),
            decoration: ShapeDecoration(
              gradient: const LinearGradient(
                begin: Alignment(-1, 0.00),
                end: Alignment(1, 0),
                colors: [Color(0xFFE2822B), Color(0xFFD87121)],
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
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: widthDevice < 400 ? 18 : 20.4,
                      fontFamily: 'ralewaymedium',
                      letterSpacing: -0.3),
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isOpen)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [dropdownContent],
          ),
      ],
    );
  }
}
