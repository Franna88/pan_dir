import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainButton extends StatelessWidget {
  final String buttonTitle;
  final Widget dropdownContent;
  final Function() onToggle;
  final bool isOpen;
  const MainButton(
      {super.key,
      required this.buttonTitle,
      required this.dropdownContent,
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
                  style: widthDevice < 1500 ? TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    height: 0,
                  ) : TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    height: 0,
                  ) ,
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
