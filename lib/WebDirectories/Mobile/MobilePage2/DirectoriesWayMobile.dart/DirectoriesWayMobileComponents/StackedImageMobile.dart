import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackedImageMobile extends StatefulWidget {
  const StackedImageMobile({super.key});

  @override
  State<StackedImageMobile> createState() => _StackedImageMobileState();
}

class _StackedImageMobileState extends State<StackedImageMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(-2, 2),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "The Eagle Team",
            style: TextStyle(
                fontSize: 20, fontFamily: 'raleway', color: Colors.black),
          ),
          SizedBox(height: 15),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MyUtility(context).width / 1.2,
                height: 60,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 235,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 197,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 159,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 121,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar4.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 83,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 45,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 7,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar1.png'),
                  radius: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
