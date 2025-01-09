import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class PreviousandCurrent extends StatefulWidget {
  final String visitors;
  final String date;
  final String previous;

  const PreviousandCurrent(
      {super.key,
      required this.visitors,
      required this.date,
      required this.previous});

  @override
  State<PreviousandCurrent> createState() => _PreviousandCurrentState();
}

class _PreviousandCurrentState extends State<PreviousandCurrent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: SizedBox(
            width: MyUtility(context).width * 0.045,
            height: MyUtility(context).height * 0.045,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.diagonal3Values(0.8, 0.6, 0.8),
              child: Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Color(0xFFFF8728),
                size:
                    MyUtility(context).width * 0.045, // Increase size slightly
              ),
            ),
          ),
        ),
        Text(
          widget.visitors,
          style: TextStyle(
            fontSize: 11.7036,
            color: Colors.white,
            fontFamily: 'raleway',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 2),
          child: Text(
            widget.date,
            style: TextStyle(
              fontSize: 9.3984,
              color: Colors.white,
              fontFamily: 'raleway',
            ),
          ),
        ),
        Text(
          widget.previous,
          style: TextStyle(
            fontSize: 12.88,
            color: Color(0xFFFFA500),
            fontFamily: 'ralewaymedium',
          ),
        )
      ],
    );
  }
}
