import 'dart:ui';

import 'package:flutter/material.dart';

class SmallGlassContainer extends StatefulWidget {
  Function(String) nextContainer;
  Widget child;
  SmallGlassContainer(
      {super.key, required this.child, required this.nextContainer});

  @override
  State<SmallGlassContainer> createState() => _GlassEffectState();
}

class _GlassEffectState extends State<SmallGlassContainer> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              widget.nextContainer('-');
            },
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.grey.shade200.withOpacity(0.3),
              size: 50,
            ),
          ),
          Stack(
            children: <Widget>[
              Center(
                child: new ClipRect(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: new Container(
                      width: widthDevice * 0.45,
                      height: heightDevice * 0.65,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.grey.shade200.withOpacity(0.3)),
                      child:  widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              widget.nextContainer('+');
            },
            icon: Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.grey.shade200.withOpacity(0.3),
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
