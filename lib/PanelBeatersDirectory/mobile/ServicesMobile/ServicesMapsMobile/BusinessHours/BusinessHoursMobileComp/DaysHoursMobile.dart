import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DaysHoursMobile extends StatelessWidget {
  final String days;
  final String BusinessHOurs;

  const DaysHoursMobile(
      {super.key, required this.days, required this.BusinessHOurs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            days,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.64,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width * 0.25,
            child: Text(
              BusinessHOurs,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
