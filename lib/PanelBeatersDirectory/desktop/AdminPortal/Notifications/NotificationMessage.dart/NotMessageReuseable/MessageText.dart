import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class MessageText extends StatefulWidget {
  final String boldText;
  final String normalText;
  const MessageText(
      {super.key, required this.boldText, required this.normalText});

  @override
  State<MessageText> createState() => _MessageTextState();
}

class _MessageTextState extends State<MessageText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.1,
          height: MyUtility(context).height * 0.045,
          child: Text(
            widget.boldText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.7364,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.045,
          child: Text(
            widget.normalText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.7364,
              fontFamily: 'raleway',
            ),
          ),
        ),
      ],
    );
  }
}
