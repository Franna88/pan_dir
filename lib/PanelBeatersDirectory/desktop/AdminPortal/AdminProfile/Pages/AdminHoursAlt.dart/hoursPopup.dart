import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../myutility.dart';
import '../../ProfileComp/buttons/AddButton.dart';
import 'selectTime.dart';

class HoursPopup extends StatefulWidget {
  String day;
  final String from;
  final String till;
  final Function(String, String) onTimeChange;
  HoursPopup(
      {super.key,
      required this.day,
      required this.from,
      required this.till,
      required this.onTimeChange});

  @override
  State<HoursPopup> createState() => _HoursPopupState();
}

class _HoursPopupState extends State<HoursPopup> {
  String startTime = "";
  String endTime = "";

  getStartTime(value) {
    setState(() {
      startTime = value;
    });
  }

  getEndTime(value) {
    setState(() {
      endTime = value;
    });
  }

  @override
  void initState() {
    startTime = widget.from;
    endTime = widget.till;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MyUtility(context).width * 0.3,
        height: MyUtility(context).height * 0.40,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            width: MyUtility(context).width,
            height: MyUtility(context).height * 0.06,
            decoration: ShapeDecoration(
              color: Color(0xFFD17226),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.09),
                  topRight: Radius.circular(8.09),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    'Pick hours - ${widget.day}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.65,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                CloseButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Start Time - ",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10,
              ),
              SelectTime(
                getTime: getStartTime,
                currentTime: startTime,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "End Time   - ",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10,
              ),
              SelectTime(
                getTime: getEndTime,
                currentTime: endTime,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          AddButton(
              text: 'Save Time',
              onPressed: () {
                widget.onTimeChange(startTime, endTime);
              }),
          SizedBox(
            height: 15,
          ),
        ]));
  }
}
