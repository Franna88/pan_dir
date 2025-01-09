import 'package:flutter/material.dart';

class SuburbDropdown extends StatelessWidget {
  final List<String> suburbs;
  final String selectedSuburb;
  final Function(String) onSuburbChanged;

  const SuburbDropdown(
      {Key? key,
      required this.suburbs,
      required this.selectedSuburb,
      required this.onSuburbChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      hint: Text("Select Suburb"),
      value: selectedSuburb.isEmpty ? null : selectedSuburb,
      items: suburbs.map((suburb) {
        return DropdownMenuItem<String>(
          value: suburb,
          child: Text(suburb),
        );
      }).toList(),
      onChanged: (value) {
        onSuburbChanged(value!);
      },
    );
  }
}
