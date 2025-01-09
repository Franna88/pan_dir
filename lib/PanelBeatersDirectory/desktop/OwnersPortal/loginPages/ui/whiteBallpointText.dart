import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteBallpointText extends StatelessWidget {
  String ballText;
  WhiteBallpointText({super.key, required this.ballText});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        width: 720,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 12),
              child: Icon(
                Icons.circle,
                color: Colors.white,
                size: 5,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            heightDevice < 710
                ? Text(
                    ballText,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 12 : 15,
                      fontFamily: 'raleway',
                      height: 1,
                    ),
                  )
                : Text(
                    ballText,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 14 : 18,
                      fontFamily: 'raleway',
                      height: 1,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
