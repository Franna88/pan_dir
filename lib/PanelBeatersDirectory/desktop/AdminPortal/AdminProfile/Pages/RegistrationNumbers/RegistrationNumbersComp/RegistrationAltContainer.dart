import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class RegistrationAltContainer extends StatelessWidget {
  final String registrationType;
  final String registrationNumber;
  final String displayProfile;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;

  const RegistrationAltContainer({
    super.key,
    required this.registrationType,
    required this.registrationNumber,
    required this.displayProfile,
    required this.pressEdit,
    required this.pressDelete,
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
              flex: 3,
              child: Text(
                registrationType,
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
              flex: 2,
              child: Text(
                registrationNumber,
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
              flex: 2,
              child: Text(
                displayProfile,
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
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: pressEdit,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
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
