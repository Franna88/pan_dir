import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackImageContainer extends StatefulWidget {
  const StackImageContainer({super.key});

  @override
  State<StackImageContainer> createState() => _StackImageContainerState();
}

class _StackImageContainerState extends State<StackImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      height: 150,
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
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MyUtility(context).width * 0.2,
                height: 60,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 241,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 201,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 161,
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
                left: 81,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 41,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 30,
                ),
              ),
              Positioned(
                top: 0,
                left: 5,
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
