import 'package:flutter/material.dart';

class AboutUsButton extends StatefulWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const AboutUsButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<AboutUsButton> createState() => _AboutUsButtonState();
}

class _AboutUsButtonState extends State<AboutUsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),),
      // width: MediaQuery.of(context).size.width * 0.085,
      // height: MediaQuery.of(context).size.height * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.zero,
          ),
          child: Row(
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
                  color: Color(0xFF0C0C0C).withOpacity(0.9),
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
