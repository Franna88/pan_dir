import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/Glasses.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 170,
            top: 150,
            child: IconButton(
              icon: Image.asset(
                'images/fuel9.png',
                height: 160,
                width: 170,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
          Positioned(
            left: 285,
            top: 200,
            child: IconButton(
              icon: Image.asset(
                'images/hammer9.png',
                height: 150,
                width: 150,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
          Positioned(
            left: 75,
            top: 200,
            child: IconButton(
              icon: Image.asset(
                'images/truck9.png',
                height: 150,
                width: 150,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
          Positioned(
            left: 75,
            top: 350,
            child: IconButton(
              icon: Image.asset(
                'images/cloud9.png',
                height: 150,
                width: 150,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
          Positioned(
            left: 285,
            top: 350,
            child: IconButton(
              icon: Image.asset(
                'images/tools9.png',
                height: 150,
                width: 150,
              ),
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
