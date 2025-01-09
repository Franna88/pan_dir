import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class ProfileDropDown extends StatefulWidget {
  final double? width;
  final double? height;
  final List<Map<String, dynamic>> items;
  final String? value;
  final String headline;
  final Function(String?) onChanged;

  const ProfileDropDown({
    super.key,
    required this.headline,
    required this.items,
    required this.value,
    required this.onChanged,
    this.width,
    this.height,
  });

  @override
  State<ProfileDropDown> createState() => _ProfileDropDownState();
}

class _ProfileDropDownState extends State<ProfileDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headline,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            width: widget.width ?? MediaQuery.of(context).size.width * 0.32,
            height: widget.height ?? MediaQuery.of(context).size.height * 0.06,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Color(0xFFE0E0E0)),
            ),
            child: DropdownButtonFormField<String>(
              iconSize: 24,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xFF0F253A),
              ),
              value: widget.value,
              onChanged: (String? value) {
                widget.onChanged(value);
              },
              items: widget.items.map((item) {
                return DropdownMenuItem<String>(
                  value: item['value'],
                  child: Text(
                    item['label'],
                    style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              dropdownColor: Colors.white,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0F253A),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
