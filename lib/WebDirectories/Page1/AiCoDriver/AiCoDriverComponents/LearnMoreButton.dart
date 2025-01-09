import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LearnMoreButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const LearnMoreButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LearnMoreButton> createState() => _LearnMoreButtonState();
}

class _LearnMoreButtonState extends State<LearnMoreButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'images/arroww.svg',
                width: 25,
                height: 25,
              ),
              SizedBox(width: 4),
              Text(
                widget.buttonText,
                style: TextStyle(
                  color: Color(0xFFFFFFFF).withOpacity(0.9),
                  fontSize: 15,
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
