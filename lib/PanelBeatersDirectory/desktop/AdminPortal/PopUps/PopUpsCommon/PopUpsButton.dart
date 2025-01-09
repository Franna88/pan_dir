import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpsButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool? waiting;

  const PopUpsButton(
      {Key? key, required this.text, required this.onTap, this.waiting})
      : super(key: key);

  @override
  State<PopUpsButton> createState() => _PopUpsButtonState();
}

class _PopUpsButtonState extends State<PopUpsButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        // width: MyUtility(context).width * 0.065,
        height: MyUtility(context).height * 0.04,
        decoration: ShapeDecoration(
          color: Color(0xFFEF9040),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: widget.waiting != null && widget.waiting == true
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.61,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
