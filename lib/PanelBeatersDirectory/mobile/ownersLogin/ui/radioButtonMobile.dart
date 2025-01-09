import 'package:flutter/material.dart';

class RadioButtonMobile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  const RadioButtonMobile(
      {super.key,
      required this.groupValue,
      required this.onChanged,
      required this.text,
      required this.value});

  Widget _buildRadioOption() {
    final bool isSelected = value == groupValue;

    return Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.white,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 10,
        ));
  }

  Widget _buildText() {
    final bool isSelected = value == groupValue;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isSelected ? Color(0xFFE2822B) : Colors.white,
        fontSize: 12,
        //fontFamily: 'raleway',
        height: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildRadioOption(),
              const SizedBox(
                width: 5,
              ),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
