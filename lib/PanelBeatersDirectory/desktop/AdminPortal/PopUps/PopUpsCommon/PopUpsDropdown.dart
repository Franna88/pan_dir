import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PopUpDropdownField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final List<DropdownMenuItem<String>> items; // List of items for the dropdown
  final String initialValue;
  void Function(String)? onChanged;

  PopUpDropdownField(
      {super.key,
      required this.text,
      required this.controller,
      required this.items,
      required this.initialValue,
      this.onChanged});

  @override
  State<PopUpDropdownField> createState() => _PopUpDropdownFieldState();
}

class _PopUpDropdownFieldState extends State<PopUpDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    print(widget.items);
    super.initState();
    selectedValue =
        widget.controller.text; // Initialize with controller value if any
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
            fontSize: 14.61,
            fontFamily: 'raleway',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8.0),
        SizedBox(
          width: MyUtility(context).width * 0.25,
          height: MyUtility(context).height * 0.045,
          child: DropdownButtonFormField<String>(
            value: widget.initialValue,
            items: widget.items,
            onChanged: (value) {
              setState(() {
                widget.controller.text =
                    value!; // Update controller with selected value
              });

              widget.onChanged != null ? widget.onChanged!(value!) : null;
            },
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
            dropdownColor: Colors.white,
            icon: Icon(Icons.arrow_drop_down, color: Colors.black),
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.02,
              fontFamily: 'raleway',
            ),
          ),
        ),
      ],
    );
  }
}
