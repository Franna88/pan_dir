import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ClearButton extends StatefulWidget {
  final String Text;

  const ClearButton({super.key, required this.Text});

  @override
  State<ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.08,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF5F6368).withOpacity(0.47),
          foregroundColor: Colors.white,
        ),
        child: Text(
          widget.Text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'ralewaysemi',
          ),
        ),
      ),
    );
  }
}
