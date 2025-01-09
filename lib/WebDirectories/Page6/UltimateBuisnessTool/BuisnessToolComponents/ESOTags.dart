import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ESOTags extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const ESOTags({super.key, required this.text, required this.onpress});

  @override
  State<ESOTags> createState() => _ESOTagsState();
}

class _ESOTagsState extends State<ESOTags> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        height: MyUtility(context).height * 0.045,
        child: ElevatedButton(
          onPressed: widget.onpress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF5F6368).withOpacity(0.47),
            foregroundColor: Colors.white,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
      ),
    );
  }
}
