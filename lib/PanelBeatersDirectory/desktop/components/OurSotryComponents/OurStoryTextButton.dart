import 'package:flutter/material.dart';

class OurStoryTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;
  final bool
      isComingSoon; // Add a flag to indicate if the button is "Coming Soon"

  const OurStoryTextButton({
    super.key,
    required this.onpress,
    required this.text,
    this.isComingSoon = false, // Default is not "Coming Soon"
  });

  @override
  State<OurStoryTextButton> createState() => _OurStoryTextButtonState();
}

class _OurStoryTextButtonState extends State<OurStoryTextButton> {
  bool isHovered = false; // Track hover state

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        alignment: Alignment.centerLeft,
        children: [
          TextButton(
            onPressed: widget.isComingSoon
                ? null // Disable onPressed if "Coming Soon"
                : widget.onpress,
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16.5,
                  fontFamily: 'raleway',
                  color: widget.isComingSoon
                      ? Colors.grey.shade600 // Make it appear visually disabled
                      : Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          if (isHovered && widget.isComingSoon)
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
