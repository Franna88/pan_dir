import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class GlassEffectPrice extends StatefulWidget {
  Widget child;
  GlassEffectPrice({super.key, required this.child});

  @override
  State<GlassEffectPrice> createState() => _GlassEffectPriceState();
}

class _GlassEffectPriceState extends State<GlassEffectPrice> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      Center(
        child: new ClipRect(
          child: new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: new Container(
              width: widthDevice * 0.88,
              height: heightDevice * 0.76,
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.grey.shade200.withOpacity(0.3)),
              child: new Center(child: widget.child),
            ),
          ),
        ),
      ),
    ]);
  }
}
