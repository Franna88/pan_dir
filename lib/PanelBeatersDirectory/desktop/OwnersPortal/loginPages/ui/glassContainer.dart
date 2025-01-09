import 'package:flutter/material.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  Widget child;
  GlassContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice < 1500
        ? Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Center(
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: widthDevice * 0.36,
                            //height: heightDevice * 0.69,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.shade200.withOpacity(0.3)),
                            child: new Center(child: child),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        :
        //-------------
        //BIGGER SCREEN
        Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: <Widget>[
                    Center(
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: widthDevice * 0.30,
                            //height: heightDevice * 0.69,
                            decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.grey.shade200.withOpacity(0.3)),
                            child: new Center(child: child),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
