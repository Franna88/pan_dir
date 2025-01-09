import 'package:flutter/material.dart';

class ExperienceDropdown extends StatefulWidget {
  final List<String> ExperienceTypes;
  final Function(String?) onChanged;
  final String initialValue;

  const ExperienceDropdown({
    Key? key,
    required this.ExperienceTypes,
    required this.onChanged,
    this.initialValue = "-select-",
  }) : super(key: key);

  @override
  State<ExperienceDropdown> createState() => _ExperienceDropdownState();
}

class _ExperienceDropdownState extends State<ExperienceDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Years Experience: ", // The heading text
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
              ...widget.ExperienceTypes.map((Experience) {
                return DropdownMenuItem(
                  value: Experience,
                  child: Text(
                    Experience,
                    style: const TextStyle(fontSize: 12), // Smaller font size
                  ),
                );
              }).toList(),
            ],
            hint: const Text(
              "Years Experience: ",
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
