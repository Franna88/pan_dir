import 'package:flutter/material.dart';

class MobileCheckMarkText extends StatelessWidget {
  String text;
  MobileCheckMarkText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          
          
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.black,
              size: 14,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  letterSpacing: 0.5),
            ),
          )
        ],
      ),
    );
  }
}
