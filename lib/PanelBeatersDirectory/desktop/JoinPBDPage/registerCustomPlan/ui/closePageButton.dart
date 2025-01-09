import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClosePageButton extends StatelessWidget {
  Function closeDialog;
  ClosePageButton({super.key, required this.closeDialog});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: () {
            closeDialog();
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
