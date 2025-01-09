import 'package:flutter/material.dart';

class AboutUsSlider extends StatefulWidget {
  @override
  _AboutUsSliderState createState() => _AboutUsSliderState();
}

class _AboutUsSliderState extends State<AboutUsSlider> {
  double _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.76,
      height: 495.72,
      decoration: BoxDecoration(
        color: Color(0xFF565858),
        borderRadius: BorderRadius.circular(34.17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: 23.35,
              height: 23.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
          Container(
            width: 17,
            height: 57.12,
            decoration: BoxDecoration(
              color: Color(0x7FD9D9D9),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Slider(
              value: _value,
              onChanged: (newValue) {
                setState(() {
                  _value = newValue;
                });
              },
              min: 0,
              max: 1,
              activeColor: Colors.transparent,
              inactiveColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              width: 23.35,
              height: 23.35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
