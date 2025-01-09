import 'package:flutter/material.dart';

class MobileDarkButton extends StatelessWidget {
  String buttonTitle;
  final Widget dropdownContent;
  final Function() onToggle;
  final bool isOpen;
  MobileDarkButton(
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
            width: widthDevice * 0.80,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.only(
              top: 5,
              left: 15,
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
                    fontSize: 17,
                    fontFamily: 'ralewaybold',
                    
                    
                    height: 1,
                  ),
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
