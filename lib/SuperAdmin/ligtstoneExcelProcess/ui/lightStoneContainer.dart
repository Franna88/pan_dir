import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class lightStoneContainer extends StatelessWidget {
  final String brid;
  final String companyName;
  final String tradingName;

  final bool isEven;

  const lightStoneContainer({
    super.key,
    required this.brid,
    required this.companyName,
    required this.tradingName,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        height: MyUtility(context).height * 0.05,
        decoration: BoxDecoration(
          color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
          border: BorderDirectional(
            start: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
            top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
            end: BorderSide(color: Color(0xFF5B5B5B)),
            bottom: BorderSide(color: Color(0xFF5B5B5B)),
          ),
        ),
        child: Row(
          children: [
            // Registration Type
            Expanded(
              flex: 1,
              child: Text(
                brid,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Vertical Divider
            Container(
              width: 0.5,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            // Registration Number
            Expanded(
              flex: 3,
              child: Text(
                companyName,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Vertical Divider
            Container(
              width: 0.5,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            // Display Profile
            Expanded(
              flex: 3,
              child: Text(
                tradingName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // Vertical Divider
            Container(
              width: 0.5,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            // Edit/Delete Buttons
          ],
        ),
      ),
    );
  }
}
