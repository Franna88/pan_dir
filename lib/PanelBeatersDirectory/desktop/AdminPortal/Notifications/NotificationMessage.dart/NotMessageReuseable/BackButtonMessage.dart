import 'package:flutter/material.dart'; // Changed to material.dart to use Material icons and widgets

class BackButtonMessage extends StatefulWidget {
  final VoidCallback onPress;

  const BackButtonMessage({super.key, required this.onPress});

  @override
  State<BackButtonMessage> createState() => _BackButtonMessageState();
}

class _BackButtonMessageState extends State<BackButtonMessage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4), // Increased padding for better tap area
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 0.5,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 24, // Adjusted icon size
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Go Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.68,
              fontFamily: 'Raleway', // Capitalized font family name
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
