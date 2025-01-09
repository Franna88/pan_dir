import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AccountLongTextField extends StatefulWidget {
  final String descriptionText;
  final double length;
  final TextEditingController? controller; // Add a controller parameter

  const AccountLongTextField({
    super.key,
    required this.descriptionText,
    required this.length,
    required this.controller, // Allow passing in a controller
  });

  @override
  State<AccountLongTextField> createState() => _AccountLongTextFieldState();
}

class _AccountLongTextFieldState extends State<AccountLongTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // If a controller is passed, use it. Otherwise, create a new one.
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Dispose of the controller if it was created internally
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.18,
          height: MyUtility(context).height * 0.035,
          child: Text(
            widget.descriptionText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * widget.length,
          height: MyUtility(context).height * 0.05,
          padding: const EdgeInsets.only(
            top: 0,
            left: 8.79,
            bottom: 15,
          ),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.22),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 3.71,
                offset: Offset(0, 3.71),
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextField(
            controller: _controller, // Attach the controller
            style: const TextStyle(
              color: Color(0xFF5F6368),
              fontSize: 14.73,
              fontFamily: 'raleway',
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12.0),
            ),
          ),
        ),
      ],
    );
  }
}
