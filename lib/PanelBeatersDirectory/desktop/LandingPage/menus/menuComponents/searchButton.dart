import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  final dynamic? onTap;
  final bool isComingSoon;
  bool? waiting;
  SearchButton({
    super.key,
    this.onTap,
    this.isComingSoon = false,
    this.waiting,
  });

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        children: [
          Container(
            /*width: MediaQuery.of(context).size.width * 0.08,*/
            /*height: MediaQuery.of(context).size.height * 0.05,*/
            child: ElevatedButton(
              onPressed: () {
                if (widget.waiting != null) {
                  if (widget.waiting == true) {
                    return;
                  }
                }
                setState(() {
                  isPressed = !isPressed;
                });
                if (widget.onTap != null) {
                  widget.onTap!();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isHovered
                    ? (isPressed ? Colors.white : Colors.black)
                    : (isPressed ? Colors.black : Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 6, bottom: 6, left: 10, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: isHovered
                            ? (isPressed ? Colors.black : Colors.white)
                            : (isPressed ? Colors.white : Colors.black),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: isHovered
                            ? (isPressed ? Colors.white : Colors.black)
                            : (isPressed ? Colors.black : Colors.white),
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: isHovered
                            ? (isPressed ? Colors.black : Colors.white)
                            : (isPressed ? Colors.white : Colors.black),
                        fontSize: 16.5,
                        fontFamily: 'raleway',
                      ),
                    ),
                    if (widget.waiting != null && widget.waiting == true)
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Container(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: isPressed ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
          if (isHovered && widget.isComingSoon)
            Positioned(
              top: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
