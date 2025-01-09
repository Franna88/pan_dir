import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MapButtons extends StatefulWidget {
  const MapButtons({super.key});

  @override
  State<MapButtons> createState() => _MapButtonsState();
}

class _MapButtonsState extends State<MapButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Text(
            'City',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.64,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          '|',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.64,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Text(
            'Suburb',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.64,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Text(
          '|',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.64,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        TextButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Text(
            'Province',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.64,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
