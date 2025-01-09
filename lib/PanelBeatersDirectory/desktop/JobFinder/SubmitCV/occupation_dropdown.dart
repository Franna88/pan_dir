import 'package:flutter/material.dart';

class OccupationDropdown extends StatefulWidget {
  final List<String> occupationTypes;
  final Function(String?) onChanged;
  final String initialValue;

  const OccupationDropdown({
    Key? key,
    required this.occupationTypes,
    required this.onChanged,
    this.initialValue = "-select-",
  }) : super(key: key);

  @override
  State<OccupationDropdown> createState() => _OccupationDropdownState();
}

class _OccupationDropdownState extends State<OccupationDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns heading to the left
      children: [
        const Text(
          "Occupation", // The heading text
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8), // Space between heading and dropdown
        Container(
          height: 40, // Set the height of the container
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(8), // Slightly smaller border radius
            border: Border.all(color: Colors.grey.shade400, width: 1),
          ),
          child: DropdownButton<String>(
            isExpanded: true, // Ensures dropdown expands to full width
            value: _selectedValue,
            underline: const SizedBox(), // Removes default underline
            icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue;
              });
              widget.onChanged(newValue);
            },
            items: [
              DropdownMenuItem(
                value: "-select-",
                child: const Text(
                  "-select-",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12, // Smaller font size
                  ),
                ),
              ),
              ...widget.occupationTypes.map((occupation) {
                return DropdownMenuItem(
                  value: occupation,
                  child: Text(
                    occupation,
                    style: const TextStyle(fontSize: 12), // Smaller font size
                  ),
                );
              }).toList(),
            ],
            hint: const Text(
              "Occupation",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12, // Smaller font size
              ),
            ),
          ),
        ),
      ],
    );
  }
}
