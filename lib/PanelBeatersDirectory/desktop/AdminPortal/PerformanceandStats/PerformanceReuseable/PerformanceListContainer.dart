import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class PerformanceListContainer extends StatelessWidget {
  final String ipAddress;
  final String linkReference;
  final String dateAndTime;

  final bool isEven;

  const PerformanceListContainer({
    super.key,
    required this.ipAddress,
    required this.linkReference,
    required this.dateAndTime,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
          border: Border(
            left: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
            top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
            right: BorderSide(color: Color(0xFF5B5B5B)),
            bottom: BorderSide(color: Color(0xFF5B5B5B)),
          ),
        ),
        height: MyUtility(context).height * 0.065,
        child: Row(
          children: [
            // ipAddress
            Expanded(
              flex: 2,
              child: Text(
                ipAddress,
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
            // linkReference
            Expanded(
              flex: 5,
              child: Text(
                linkReference,
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
            // dateAndTime
            Expanded(
              flex: 2,
              child: Text(
                dateAndTime,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            // dateAndTime
          ],
        ),
      ),
    );
  }
}
