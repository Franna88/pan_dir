import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PanelFooterTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onpress;

  const PanelFooterTextButton({Key? key, required this.text, required this.onpress});

  @override
  State<PanelFooterTextButton> createState() => _PanelFooterTextButtonState();
}

class _PanelFooterTextButtonState extends State<PanelFooterTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.065,
      height: 20,
      child: TextButton(
        onPressed: widget.onpress,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'raleway',
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}