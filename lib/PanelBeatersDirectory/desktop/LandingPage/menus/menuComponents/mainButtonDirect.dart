import 'package:flutter/material.dart';

class MainButtonDirect extends StatefulWidget {
  final String buttonTitle;
  final bool isComingSoon;
  final Function() onTap;

  const MainButtonDirect({
    Key? key,
    required this.buttonTitle,
    this.isComingSoon = false,
    required this.onTap,
  });

  @override
  _MainButtonDirectState createState() => _MainButtonDirectState();
}

class _MainButtonDirectState extends State<MainButtonDirect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: widget.isComingSoon ? null : widget.onTap,
      child: MouseRegion(
        onEnter: (_) {
          if (widget.isComingSoon) {
            setState(() {
              isHovered = true;
            });
          }
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
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
                    widget.buttonTitle,
                    style: widthDevice < 1500
                        ? const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'ralewaymedium',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            height: 0,
                          )
                        : const TextStyle(
                            color: Colors.black,
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
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            if (widget.isComingSoon && isHovered)
              Positioned(
                bottom: 25,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Text(
                      "Coming Soon",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
