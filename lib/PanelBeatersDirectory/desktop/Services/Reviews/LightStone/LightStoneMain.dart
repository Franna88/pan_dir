import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class LightStoneMain extends StatefulWidget {
  const LightStoneMain({super.key});

  @override
  State<LightStoneMain> createState() => _LightStoneMainState();
}

class _LightStoneMainState extends State<LightStoneMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MyUtility(context).height,
          width: MyUtility(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mainbackgroundPanel.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Container(
              width: 1219.92,
              height: 677.96,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.56, -0.83),
                  end: Alignment(-0.56, 0.83),
                  colors: [
                    Colors.white.withOpacity(0.10000000149011612),
                    Colors.white.withOpacity(0.4000000059604645)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xBF000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
