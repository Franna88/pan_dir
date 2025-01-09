import 'package:flutter/material.dart';

class OwnMessageText extends StatefulWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final List<Shadow>? shadows;
  final FontWeight? fontWeight;
  const OwnMessageText(
      {super.key,
      required this.text,
      this.fontSize,
      this.textColor,
      this.shadows,
      this.fontWeight});

  @override
  State<OwnMessageText> createState() => _OwnMessageTextState();
}

class _OwnMessageTextState extends State<OwnMessageText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: TextStyle(
            shadows: const [
              Shadow(
                offset: Offset(2.0, 2.0), // Position of the shadow
                blurRadius: 3.0, // Blur radius
                color: Color.fromARGB(255, 0, 0, 0), // Shadow color
              ),
            ],
            fontSize: widget.fontSize ?? 22,
            color: widget.textColor ?? Colors.white,
            fontWeight: FontWeight.bold));
  }
}

class OwnMultiText extends StatefulWidget {
  final String text1;
  final Color colors1;
  final Color? colors2;
  final String text2;
  const OwnMultiText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.colors1,
      this.colors2});

  @override
  State<OwnMultiText> createState() => _OwnMultiTextState();
}

class _OwnMultiTextState extends State<OwnMultiText> {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: widget.text1,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextSpan(
            text: widget.text2,
            style: TextStyle(
                color: widget.colors2 ?? Colors.purple,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const BoldText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;

  const NormalText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
