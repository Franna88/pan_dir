import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ReqruitDetails extends StatelessWidget {
  final String year;
  final String month;
  final String day;
  final String occupation;
  final String contact;
  final String name;
  final String qualification;
  final String location;
  final String years;
  final String email;

  const ReqruitDetails(
      {super.key,
      required this.year,
      required this.month,
      required this.day,
      required this.occupation,
      required this.contact,
      required this.name,
      required this.qualification,
      required this.location,
      required this.years,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.72,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF5B5B5B), width: 1),
      ),
      child: Column(
        children: [
          _buildRow('Date Published:', '$year-$month-$day', true),
          _buildRow('Occupation:', occupation, false),
          _buildRow('qualification:', qualification, true),
          _buildRow('Years Experience:', years, false),
          _buildRow('Area / Areas Looking for Work:', location, true),
          _buildRow('Name & Surname:', name, false),
          _buildRow('Contact Number:', contact, true),
          _buildRow('Email Address:', email, false),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value, bool isEven) {
    return Container(
      color: isEven ? const Color(0xFF0E1013) : const Color(0x7F292E31),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
