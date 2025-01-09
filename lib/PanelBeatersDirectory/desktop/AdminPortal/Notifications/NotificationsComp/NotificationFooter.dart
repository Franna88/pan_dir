import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class NotificationFooter extends StatefulWidget {
  const NotificationFooter({super.key});

  @override
  State<NotificationFooter> createState() => _NotificationFooterState();
}

class _NotificationFooterState extends State<NotificationFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1403,
      height: 90,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Color(0xFFF5F7F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MyUtility(context).width * 0.15,
                  height: 7.52,
                  decoration: ShapeDecoration(
                    color: Color(0xFFDADBDF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.79),
                    ),
                  ),
                ),
                Text(
                  'Terms • Privacy • Program Policies',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5400000214576721),
                    fontSize: 11.2204,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Last account activity: 37 minutes ago',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5400000214576721),
                        fontSize: 11.2204,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5400000214576721),
                        fontSize: 11.2204,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
