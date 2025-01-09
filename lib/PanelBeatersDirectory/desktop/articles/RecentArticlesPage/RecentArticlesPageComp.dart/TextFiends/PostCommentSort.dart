import 'package:flutter/material.dart';

class Postcommentsort extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const Postcommentsort({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<Postcommentsort> createState() => _PostcommentsortState();
}

class _PostcommentsortState extends State<Postcommentsort> {
  @override
  Widget build(BuildContext context) {
    
var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: widthDevice * 0.20,
      height: 36,
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'raleway',
        ),
        decoration: InputDecoration(
          hintText: '* ${widget.hintText}',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 16,
            fontFamily: 'raleway',
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 8,
          ),
        ),
      ),
    );
  }
}
