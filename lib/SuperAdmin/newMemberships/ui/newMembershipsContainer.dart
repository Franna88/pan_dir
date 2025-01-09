import 'package:flutter/material.dart';

class NewMembershipData {
  final String listingName;
  final String membershipType;
  final String dateAdded;
  final String phoneNumber;
  final String email;

  NewMembershipData(
      {required this.listingName,
      required this.membershipType,
      required this.dateAdded,
      required this.phoneNumber,
      required this.email});
}

class NewMembershipsContainer extends StatelessWidget {
  final NewMembershipData membershipData;
  final bool isEven;
  final Function onViewTap;
  final Function onDeleteTap;
  const NewMembershipsContainer(
      {super.key,
      required this.isEven,
      required this.membershipData,
      required this.onViewTap,
      required this.onDeleteTap});

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
                membershipData.listingName,
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
                membershipData.dateAdded,
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
                membershipData.membershipType,
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
                membershipData.email,
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
                membershipData.phoneNumber,
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
                    onTap: () {
                      onViewTap();
                    },
                    child: Tooltip(
                      message: 'View Application',
                      child: Icon(
                        Icons.description,
                        color: Colors.white,
                        size: 20.0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      onDeleteTap();
                    },
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
