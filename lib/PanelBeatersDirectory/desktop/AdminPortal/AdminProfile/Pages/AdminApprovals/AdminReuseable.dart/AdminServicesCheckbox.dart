import 'package:flutter/material.dart';

class AdminServicesCheckBox extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const AdminServicesCheckBox({
    Key? key,
    required this.label,
    this.initialValue = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AdminServicesCheckBox> createState() => _AdminServicesCheckBoxState();
}

class _AdminServicesCheckBoxState extends State<AdminServicesCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
              widget.onChanged(_isChecked);
            });
          },
          child: Container(
            width: 16,
            height: 16,
            decoration: ShapeDecoration(
              color: widget.initialValue ? Colors.orange : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.21),
              ),
            ),
            child: widget.initialValue
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )
                : null,
          ),
        ),
        SizedBox(width: 8),
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 15.6,
            fontFamily: 'ralewayMedium',
          ),
        ),
      ],
    );
  }
}
