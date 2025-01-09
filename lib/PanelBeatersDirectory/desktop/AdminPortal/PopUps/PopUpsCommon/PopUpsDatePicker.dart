import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';

class PopUpDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final String text;

  const PopUpDatePicker({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  _PopUpDatePickerState createState() => _PopUpDatePickerState();
}

class _PopUpDatePickerState extends State<PopUpDatePicker> {
  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.73,
            fontFamily: 'raleway',
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: MyUtility(context).width * 0.25,
          height: MyUtility(context).height * 0.045,
          child: TextFormField(
            controller: widget.controller,
            readOnly: true, // Prevent manual editing
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
