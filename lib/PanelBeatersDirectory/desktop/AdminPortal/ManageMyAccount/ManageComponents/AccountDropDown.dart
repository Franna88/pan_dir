import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class AccountDropDown extends StatefulWidget {
  final String descriptionText;
  final double length;
  final String selectedValue;
  final List<String> options;

  const AccountDropDown({
    super.key,
    required this.descriptionText,
    required this.length,
    required this.selectedValue,
    required this.options,
  });

  @override
  State<AccountDropDown> createState() => _AccountDropDownState();
}

class _AccountDropDownState extends State<AccountDropDown> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.selectedValue; // Initialize with the passed default value
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
          padding: const EdgeInsets.symmetric(horizontal: 8.79),
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
          child: DropdownButtonHideUnderline(
            // Hides the underline to avoid extra spacing
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: Color(0xFF5F6368),
                        fontSize: 14.73,
                        fontFamily: 'raleway',
                      ),
                    ),
                  ),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
              dropdownColor: Colors.white,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
