import 'package:flutter/material.dart';

class BallPointText extends StatelessWidget {
  String ballText;
  BallPointText({super.key, required this.ballText});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        width: widthDevice * 0.40,
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.circle,
                      color: Colors.black,
                      size: 5,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    ballText,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: widthDevice / 98,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1
                    ),
                  ),
                  
                ],
              ),
      ),
    );
  }
}