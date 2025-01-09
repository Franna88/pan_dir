import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:intl/intl.dart';

class PerformanceDatePicker extends StatefulWidget {
  DateTime lastDayMonth;
  DateTime firstDayMonth;
  Function(String, DateTime) updateDates;
  Function getNewDataForGraph;

  PerformanceDatePicker({
    super.key,
    required this.firstDayMonth,
    required this.lastDayMonth,
    required this.updateDates,
    required this.getNewDataForGraph,
  });
  @override
  _PerformanceDatePickerState createState() => _PerformanceDatePickerState();
}

class _PerformanceDatePickerState extends State<PerformanceDatePicker> {
  DateTime? selectedFromDate;
  DateTime? selectedToDate;

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF7A7A7A), // header background color
              onPrimary: Colors.white, // header text color
              surface: Color(0xFF2E2E2E), // background color of the picker
              onSurface: Colors.white, // text color of the picker
            ),
            dialogBackgroundColor:
                Color(0xFF3E3E3E), // background color of the dialog
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null &&
        pickedDate != (isFromDate ? selectedFromDate : selectedToDate)) {
      setState(() {
        if (isFromDate) {
          selectedFromDate = pickedDate;
          widget.updateDates("FromDate", pickedDate);
        } else {
          selectedToDate = pickedDate;
          widget.updateDates("ToDate", pickedDate);
        }
      });
    }
  }

  @override
  void initState() {
    selectedFromDate = widget.firstDayMonth;
    selectedToDate = widget.lastDayMonth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Select date from:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.64,
              fontFamily: 'ralewaymedium',
            ),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: () => _selectDate(context, true),
            child: Row(
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.white, size: 24),
                SizedBox(width: 12),
                Text(
                  selectedFromDate != null
                      ? "${selectedFromDate!.month.toString().padLeft(2, '0')}/${selectedFromDate!.day.toString().padLeft(2, '0')}/${selectedFromDate!.year.toString().substring(2)}"
                      : "MM/DD/YY",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8700000047683716),
                      fontSize: 16),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Select date to:",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.64,
              fontFamily: 'ralewaymedium',
            ),
          ),
          SizedBox(height: MyUtility(context).height * 0.02),
          InkWell(
            onTap: () => _selectDate(context, false),
            child: Row(
              children: <Widget>[
                Icon(Icons.calendar_today, color: Colors.white, size: 24),
                SizedBox(width: 12),
                Text(
                  selectedToDate != null
                      ? "${selectedToDate!.month.toString().padLeft(2, '0')}/${selectedToDate!.day.toString().padLeft(2, '0')}/${selectedToDate!.year.toString().substring(2)}"
                      : "MM/DD/YY",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8700000047683716),
                      fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
