import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttachmentPopupButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const AttachmentPopupButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AttachmentPopupButton> createState() => _AttachmentPopupButtonState();
}

class _AttachmentPopupButtonState extends State<AttachmentPopupButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: Color(0xFFEF9040),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.73,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
