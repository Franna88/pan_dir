import 'package:flutter/material.dart';

class CloseButton extends StatefulWidget {
  const CloseButton({super.key});

  @override
  State<CloseButton> createState() => _CloseButtonState();
}

class _CloseButtonState extends State<CloseButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
