import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class ManageUserInfo extends StatefulWidget {
  final String year;
  final String month;
  final String day;
  final String email;
  final String fullName;
  final String status;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;
  final bool showEdit;

  const ManageUserInfo(
      {super.key,
      required this.year,
      required this.month,
      required this.day,
      required this.email,
      required this.fullName,
      required this.status,
      required this.pressEdit,
      required this.pressDelete,
      required this.isEven,
      required this.showEdit});

  @override
  State<ManageUserInfo> createState() => _ManageUserInfoState();
}

class _ManageUserInfoState extends State<ManageUserInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: widget.isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
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
            // Date
            Expanded(
              flex: 2,
              child: Text(
                '${widget.year}/${widget.month}/${widget.day}',
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
            // Email
            Expanded(
              flex: 2,
              child: Text(
                widget.email,
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
            // Full Name
            Expanded(
              flex: 2,
              child: Text(
                widget.fullName,
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
            // Status
            Expanded(
              flex: 2,
              child: Text(
                widget.status,
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

            // Vertical Divider
            Container(
              width: 0.5,
              color: Color(0xFF5B5B5B),
            ),
            SizedBox(width: 10),
            // Edit/Delete Buttons
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Visibility(
                    visible: !widget.showEdit,
                    child: GestureDetector(
                      onTap: widget.pressEdit,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  /*GestureDetector(
                    onTap: widget.pressDelete,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
