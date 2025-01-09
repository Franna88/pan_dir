import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class CommonButtonR extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPress;
  final double? width;
  final bool isComingSoon;

  const CommonButtonR({
    super.key,
    required this.buttonText,
    required this.onPress,
    this.width,
    this.isComingSoon = false,
  });

  @override
  State<CommonButtonR> createState() => _CommonButtonRState();
}

class _CommonButtonRState extends State<CommonButtonR> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isComingSoon ? null : widget.onPress,
      child: MouseRegion(
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: widget.width ?? MyUtility(context).width * 0.14,
              height: 36.72,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 26.5744,
                      height: 26.5744,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.buttonText,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.8999999761581421),
                        fontSize: 15.64,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
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
      ),
    );
  }
}
