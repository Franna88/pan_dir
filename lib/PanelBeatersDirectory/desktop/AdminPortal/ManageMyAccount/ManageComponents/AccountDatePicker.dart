import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';

class AccountDatePicker extends StatefulWidget {
  final String descriptionText;
  final double length;
  final String hintText;
  const AccountDatePicker(
      {super.key,
      required this.descriptionText,
      required this.length,
      required this.hintText});

  @override
  State<AccountDatePicker> createState() => _AccountDatePickerState();
}

class _AccountDatePickerState extends State<AccountDatePicker> {
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFF5F6368),
              onPrimary: Colors.black,
              surface: Color(0xFF2D2D2D),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Color(0xFF2D2D2D), // Background color
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.7364,
              fontFamily: 'raleway',
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            width: MyUtility(context).width * widget.length,
            height: MyUtility(context).height * 0.05,
            padding: const EdgeInsets.symmetric(horizontal: 8.79),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.22),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 3.71,
                  offset: Offset(0, 3.71),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _dateController,
                    style: TextStyle(
                      color: Color(0xFF5F6368),
                      fontSize: 14.73,
                      fontFamily: 'raleway',
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: Color(0xFF5F6368),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                    readOnly: true,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: Color(0xFF5F6368),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
