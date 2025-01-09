import 'package:flutter/material.dart';

class SmallScreenRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  const SmallScreenRadioButton(
      {super.key,
      required this.groupValue,
      required this.onChanged,
      required this.text,
      required this.value});
      

  Widget _buildRadioOption() {
    
    final bool isSelected = value == groupValue;
    
    return Container(
      
        width:  15,
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
        fontSize: 14,
        //fontFamily: 'raleway',
        height: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: Colors.green,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildRadioOption(),
              const SizedBox(
                width: 10,
              ),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
