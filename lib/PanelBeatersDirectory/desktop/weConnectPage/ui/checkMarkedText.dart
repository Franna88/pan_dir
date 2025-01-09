import 'package:flutter/material.dart';

class CheckMarkedText extends StatelessWidget {
  
  
  
  String text;
  CheckMarkedText(
      {super.key,
      
      
      required this.text,
      });

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Color(0xFFE2822B),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.check,
              color: Colors.black,
              size: 10,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFFF4F4F4),
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1
                
              ),
              
            ),
          )
        ],
      ),
    );
  }
}
