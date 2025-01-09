import 'dart:ui';

import 'package:flutter/material.dart';

class GlassEffect extends StatefulWidget {
  Widget child;
  GlassEffect({super.key, required this.child});

  @override
  State<GlassEffect> createState() => _GlassEffectState();
}

class _GlassEffectState extends State<GlassEffect> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: widthDevice * 0.30,
              //height: heightDevice * 0.76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200.withOpacity(0.3)),
              child: Center(child: widget.child),
            ),
          ),
        ),
      ),
    ]);
  }
}
