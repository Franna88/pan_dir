import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class NotificationSearch extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const NotificationSearch({super.key, required this.onChanged});

  @override
  State<NotificationSearch> createState() => _NotificationSearchState();
}

class _NotificationSearchState extends State<NotificationSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.35,
      height: MyUtility(context).height * 0.05,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F4),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2), // Slight shadow for elevation effect
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          widget.onChanged(value);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey), // Search icon
          hintText: 'Search mail',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.5400000214576721),
            fontSize: 13.95,
            fontFamily: 'raleway',
          ),
          border: InputBorder.none, // No default border
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        ),
        style: const TextStyle(
          color: Colors.black, // Text color
          fontFamily: 'raleway',
          fontSize: 13.95,
        ),
      ),
    );
  }
}
