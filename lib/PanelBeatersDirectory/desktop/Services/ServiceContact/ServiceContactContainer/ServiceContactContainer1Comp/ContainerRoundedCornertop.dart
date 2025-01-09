import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ContainerRoundedCornerTop extends StatefulWidget {
  final String contactList;
  final String contactDetails;

  const ContainerRoundedCornerTop(
      {Key? key, required this.contactList, required this.contactDetails});

  @override
  State<ContainerRoundedCornerTop> createState() =>
      _ContainerRoundedCornerTopState();
}

class _ContainerRoundedCornerTopState extends State<ContainerRoundedCornerTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      height: 35.36,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 206.72,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.0020000000949949026),
              border: Border(
                left: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                right: BorderSide(color: Color(0xFF5B5B5B)),
                bottom: BorderSide(color: Color(0xFF5B5B5B)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          widget.contactList,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.64,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MyUtility(context).width * 0.701,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              border: Border(
                left: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                top: BorderSide(width: 1, color: Color(0xFF5B5B5B)),
                right: BorderSide(color: Color(0xFF5B5B5B)),
                bottom: BorderSide(color: Color(0xFF5B5B5B)),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          widget.contactDetails,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
