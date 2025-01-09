import 'package:flutter/material.dart';

class IconButtons extends StatefulWidget {
  final bool isComingSoon;

  const IconButtons({
    Key? key,
    this.isComingSoon = false,
  }) : super(key: key);

  @override
  State<IconButtons> createState() => _IconButtonsState();
}

class _IconButtonsState extends State<IconButtons> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isComingSoon
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
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
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left arrow button
                IconButton(
                  onPressed: widget.isComingSoon
                      ? null
                      : () {
                          debugPrint('Left arrow pressed');
                        },
                  icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Right arrow button
                IconButton(
                  onPressed: widget.isComingSoon
                      ? null
                      : () {
                          debugPrint('Right arrow pressed');
                        },
                  icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF8828),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                // "Coming Soon" tooltip
              ],
            ),
            if (isHovered && widget.isComingSoon)
              Padding(
                padding: const EdgeInsets.only(left: 10),
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
                        fontSize: 10,
                        fontFamily: 'Raleway',
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
