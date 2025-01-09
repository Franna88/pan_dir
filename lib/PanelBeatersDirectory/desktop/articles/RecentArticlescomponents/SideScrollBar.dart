import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class SideScrollBar extends StatefulWidget {
  const SideScrollBar({super.key});

  @override
  State<SideScrollBar> createState() => _SideScrollBarState();
}

class _SideScrollBarState extends State<SideScrollBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: MyUtility(context).height,
      decoration: ShapeDecoration(
        color: Color(0xFFCECDCD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34.17),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
