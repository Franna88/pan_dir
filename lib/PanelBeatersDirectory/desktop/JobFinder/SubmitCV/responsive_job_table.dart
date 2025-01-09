import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/noIconOrangeButton.dart';
import 'package:webdirectories/myutility.dart';

class ResponsiveJobTable extends StatelessWidget {
  ResponsiveJobTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.8,
      height: MyUtility(context).height * 0.3,
      decoration: BoxDecoration(
        color: Color(0xFF181B1D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MyUtility(context).width * 0.8,
          ),
          child: Table(
            children: [
              TableRow(
                children: [
                  _buildHeaderCell('Date'),
                  _buildHeaderCell('Job Title/Occupancy'),
                  _buildHeaderCell('Location'),
                  _buildHeaderCell('Employer'),
                  _buildHeaderCell('Details'),
                ],
              ),
              ...List.generate(5, (index) {
                bool isEvenRow = index % 2 == 0;
                return TableRow(
                  children: [
                    _buildDataCell('2024-12-0${index + 5}', isEvenRow),
                    _buildDataCell(getJobTitle(index), isEvenRow),
                    _buildDataCell(getLocation(index), isEvenRow),
                    _buildDataCell(getEmployer(index), isEvenRow),
                    _buildDataCellWithButton(
                        isEvenRow), // Replace text with button
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      height: 45, // Set height for header cells
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF181B1D),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'raleway',
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildDataCell(String text, bool isEvenRow) {
    return Container(
      height: 45, // Set height for data cells
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        color: isEvenRow ? Colors.black : Colors.grey[800],
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'raleway',
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildDataCellWithButton(bool isEvenRow) {
    return Container(
      height: 45, // Set height for button cell
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 0.5),
        color: isEvenRow ? Colors.black : Colors.grey[800],
      ),
      child: NoIconOrangeButton(buttonText: 'Apply Now'), // Add button widget
    );
  }

  String getJobTitle(int index) {
    List<String> jobTitles = [
      'Marketing Specialist',
      'Project Manager',
      'HR Assistant',
      'Sales Executive',
      'Operations Manager',
    ];
    return jobTitles[index];
  }

  String getLocation(int index) {
    List<String> locations = [
      'Pretoria',
      'Cape Town',
      'Port Elizabeth',
      'Bloemfontein',
      'Durban',
    ];
    return locations[index];
  }

  String getEmployer(int index) {
    List<String> employers = [
      'Creative Solutions',
      'Tech Innovators',
      'Global Corp',
      'RetailPro',
      'FastTrack Ltd',
    ];
    return employers[index];
  }
}
