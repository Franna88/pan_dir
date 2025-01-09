import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopupCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final String text;

  const PopupCheckBox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  _PopupCheckBoxState createState() => _PopupCheckBoxState();
}

class _PopupCheckBoxState extends State<PopupCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Row(
        children: [
          Container(
            width: MyUtility(context).width * 0.012,
            height: MyUtility(context).height * 0.025,
            decoration: ShapeDecoration(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: widget.value ? Color(0xFFEF9040) : Colors.grey,
                  width: 2,
                ),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.check,
                size: MyUtility(context).height * 0.02,
                color: widget.value ? Color(0xFFEF9040) : Colors.transparent,
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            widget.text,
            style: TextStyle(
              color: Color(0xFF5B5B5B),
              fontSize: 12.2,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
