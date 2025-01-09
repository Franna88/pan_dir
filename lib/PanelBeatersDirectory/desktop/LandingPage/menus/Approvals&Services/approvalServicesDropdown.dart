import 'package:flutter/material.dart';

class ApprovalServicesDropdown extends StatefulWidget {
  @override
  _ApprovalServicesDropdownState createState() =>
      _ApprovalServicesDropdownState();
}

class _ApprovalServicesDropdownState extends State<ApprovalServicesDropdown> {
  final List<String> _options = [
    "Air Conditioning Repair",
    "Airbag Repair",
    "All Vehicles Outside Factory Warranty",
    "Assessments"
  ];

  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Adjust background as needed
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Select',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(height: 2, color: Colors.grey[400]),
              Container(
                height: 120, // Scrollable height
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _options.length,
                  itemBuilder: (context, index) {
                    final option = _options[index];
                    return ListTile(
                      title: Text(
                        option,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedOption = option;
                        });
                        // Close dialog if required
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
