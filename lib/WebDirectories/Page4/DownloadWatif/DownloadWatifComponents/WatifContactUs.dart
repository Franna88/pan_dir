import 'package:flutter/material.dart';

class WatifContactUs extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const WatifContactUs({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<WatifContactUs> createState() => _WatifContactUsState();
}

class _WatifContactUsState extends State<WatifContactUs> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.085,
      height: MediaQuery.of(context).size.height * 0.045,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.zero,
              child: Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 4),
            Text(
              widget.buttonText,
              style: TextStyle(
                color: Color(0xE6000000).withOpacity(0.9),
                fontSize: 15.0,
                fontFamily: 'raleway',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
