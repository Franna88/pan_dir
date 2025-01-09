import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashJobReuseable.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashNotificationReuse.dart';
import 'package:webdirectories/myutility.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class DashNotificationsUp extends StatefulWidget {
  List notificationsList;
  final VoidCallback onTap;
  DashNotificationsUp(
      {super.key, required this.notificationsList, required this.onTap});

  @override
  State<DashNotificationsUp> createState() => _DashNotificationsUpState();
}

class _DashNotificationsUpState extends State<DashNotificationsUp> {
  final ScrollController _scrollController = ScrollController();

  formatDate(date) {
    return "${date.toDate().year.toString()} - ${date.toDate().month.toString()} - ${date.toDate().day.toString()}";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: MyUtility(context).width * 0.345,
        height: MyUtility(context).height * 0.4,
        decoration: ShapeDecoration(
          color: Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.19),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Updates & Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.61,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                    Text(
                      'Read More',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFFD6D6D6),
                        fontSize: 11.09,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'ralewaymedium',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: DraggableScrollbar.rrect(
                  controller: _scrollController,
                  backgroundColor: Color(0x7F9E9E9F),
                  alwaysVisibleScrollThumb: true,
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      for (var i = 0; i < widget.notificationsList.length; i++)
                        DashNotificationReuse(
                          date: formatDate(widget.notificationsList[i]['date']),
                          position: widget.notificationsList[i]['title'],
                        ),
                      /*      DashNotificationReuse(
                        date: '2024-10-22',
                        position:
                            'Move forward with the Panel Beater Directory!',
                      ),
                      DashNotificationReuse(
                        date: '2024-09-17',
                        position:
                            'Hail Mail: Maximize Your Hail Damage Repair Profits today!',
                      ),
                      DashNotificationReuse(
                        date: '2024-07-01',
                        position:
                            'Important Update - Price increase August 2023',
                      ),
                      DashNotificationReuse(
                        date: '2024-05-30',
                        position:
                            'Aer-O-Cure: GYS DENTPULLING WORKSTATIONS Improve your repair time',
                      ),
                      DashNotificationReuse(
                        date: '2024-05-30',
                        position:
                            'Aer-O-Cure: GYS DENTPULLING WORKSTATIONS Improve your repair time',
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
