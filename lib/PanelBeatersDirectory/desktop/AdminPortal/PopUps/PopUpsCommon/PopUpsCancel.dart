import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpsCancel extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool? waiting;
  final Color buttonColor;

  const PopUpsCancel(
      {Key? key,
      required this.text,
      required this.onTap,
      this.waiting,
      required this.buttonColor})
      : super(key: key);

  @override
  State<PopUpsCancel> createState() => _PopUpsCancelState();
}

class _PopUpsCancelState extends State<PopUpsCancel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: MyUtility(context).width * 0.065,
        height: MyUtility(context).height * 0.04,
        decoration: ShapeDecoration(
          color: widget.buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
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
    );
  }
}
