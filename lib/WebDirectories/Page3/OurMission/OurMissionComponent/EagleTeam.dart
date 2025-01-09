import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class EagleTeam extends StatefulWidget {
  const EagleTeam({super.key});

  @override
  State<EagleTeam> createState() => _EagleTeamState();
}

class _EagleTeamState extends State<EagleTeam> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "The Eagle Team",
              style: TextStyle(
                  fontSize: 18.0, fontFamily: 'raleway', color: Colors.black),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: MyUtility(context).width * 0.18,
                height: 40,
                color: Colors.white,
              ),
              Positioned(
                top: 0,
                left: 166,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar7.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 140,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar6.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 114,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar5.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 88,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar4.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 62,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar3.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 36,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar2.png'),
                  radius: 20,
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/avitar1.png'),
                  radius: 20,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
