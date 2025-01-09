import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class NavButton extends StatefulWidget {
  final String navIcon;
  final String navText;
  final bool isSelected;
  final bool isComingSoon;
  final VoidCallback onTap;

  const NavButton({
    Key? key,
    required this.navIcon,
    required this.navText,
    required this.isSelected,
    required this.onTap,
    this.isComingSoon = false,
  }) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool isHovered = false;

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
        if (widget.isComingSoon) {
          setState(() {
            isHovered = false;
          });
        }
      },
      cursor: widget.isComingSoon
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.isComingSoon ? null : widget.onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: MyUtility(context).height * 0.05,
              decoration: ShapeDecoration(
                color: widget.isSelected
                    ? const Color(0xFF0E1013)
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color:
                        widget.isSelected ? Colors.white : Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(37.99),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.isSelected)
                      SvgPicture.asset(
                        widget.navIcon,
                        width: 20,
                        height: 20,
                        color: const Color(0xFFFF8728),
                      ),
                    if (widget.isSelected) const SizedBox(width: 8),
                    Text(
                      widget.navText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MyUtility(context).width * 0.0145,
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isHovered && widget.isComingSoon)
              Positioned(
                top: -30, // Adjust tooltip position as needed
                left: 0,
                right: 0,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Coming Soon",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
      ),
    );
  }
}
