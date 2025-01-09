import 'package:flutter/material.dart';

class MobileMenuIndex extends StatefulWidget {
  int menuIndex;

  MobileMenuIndex({super.key, required this.menuIndex});

  @override
  State<MobileMenuIndex> createState() => _MobileMenuIndexState();
}

class _MobileMenuIndexState extends State<MobileMenuIndex> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
        SizedBox(width: 6,),
        Text(
          "${widget.menuIndex}/5",
          style: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        SizedBox(width: 6,),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
