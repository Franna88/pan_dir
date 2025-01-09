import 'package:flutter/material.dart';

class Dividers extends StatelessWidget {
  const Dividers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2,
      width: 75,
      child: new Center(
        child: new Container(
          margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
          height: 2,
          color: const Color.fromARGB(255, 114, 113, 113),
        ),
      ),
    );
  }
}
