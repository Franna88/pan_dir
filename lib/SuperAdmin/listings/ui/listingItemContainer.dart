import 'package:flutter/material.dart';

import '../../../myutility.dart';

class Listingitemcontainer extends StatelessWidget {
  String tradingName;
  String membership;
  String country;
  String province;
  String city;
  String suburb;
  String status;
  String featured;
  String sf;
  String contact;

  final bool isEven;
  VoidCallback pressEdit;
  VoidCallback pressDelete;

  Listingitemcontainer(
      {super.key,
      required this.tradingName,
      required this.membership,
      required this.country,
      required this.province,
      required this.city,
      required this.suburb,
      required this.status,
      required this.featured,
      required this.sf,
      required this.contact,
      required this.isEven,
      required this.pressDelete,
      required this.pressEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        //  height: MyUtility(context).height * 0.05,
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
              flex: 3,
              child: Text(
                tradingName,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            // Registration Number
            Expanded(
              flex: 3,
              child: Text(
                membership,
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
              height: 80,
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                country,
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
              height: 80,
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                province,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                city,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                suburb,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(
                status,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(
                featured,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(
                sf,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Text(
                contact,
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
              height: 80,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),

            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: pressEdit,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: pressDelete,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
