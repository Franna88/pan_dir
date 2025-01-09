import 'package:flutter/material.dart';

class MobileSearchButton extends StatefulWidget {
  final Function? onPressed;
  const MobileSearchButton({
    super.key,
    this.onPressed,
  });

  @override
  State<MobileSearchButton> createState() => _MobileSearchButtonState();
}

class _MobileSearchButtonState extends State<MobileSearchButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      /*width: MediaQuery.of(context).size.width * 0.08,*/
      /*height: MediaQuery.of(context).size.height * 0.05,*/
      child: ElevatedButton(
        onPressed: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
          setState(() {
            isPressed = !isPressed;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isPressed ? Colors.black : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isPressed ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: isPressed ? Colors.black : Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Search',
                style: TextStyle(
                  color: isPressed ? Colors.white : Colors.black,
                  fontSize: 16.5,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
