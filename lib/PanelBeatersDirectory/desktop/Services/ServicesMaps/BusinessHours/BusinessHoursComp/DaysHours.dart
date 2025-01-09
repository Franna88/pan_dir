import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DaysHours extends StatelessWidget {
  final String days;
  final String BusinessHOurs;

  const DaysHours({super.key, required this.days, required this.BusinessHOurs});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.22,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            days,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyUtility(context).width * 0.0111,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: MyUtility(context).width * 0.1,
            child: Text(
              BusinessHOurs,
              style: TextStyle(
                color: Colors.white,
                fontSize: MyUtility(context).width * 0.0111,
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
