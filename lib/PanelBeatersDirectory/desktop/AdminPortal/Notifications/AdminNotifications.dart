import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationsTitle.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/formatUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AdminNotifications extends StatefulWidget {
  const AdminNotifications({super.key});

  @override
  State<AdminNotifications> createState() => _AdminNotificationsState();
}

class _AdminNotificationsState extends State<AdminNotifications> {
  final _firestore = FirebaseFirestore.instance;
  List<NotificationsModel> _notificationData = [];
  String _searchQuery = '';
  bool _isLoading = true;
  @override
  void initState() {
    _fetchNotificationData();
    super.initState();
  }

  void _fetchNotificationData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return;
    }

    final notificationsFuture = _firestore
        .collection('notifications')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .orderBy('notificationDate', descending: true)
        .get();

    final generalNotificationsFuture = _firestore
        .collection('notifications')
        .where('listingsId', isEqualTo: 0)
        .orderBy('notificationDate', descending: true)
        .get();

    // Run both queries in parallel
    List<QuerySnapshot<Map<String, dynamic>>> results =
        await Future.wait([notificationsFuture, generalNotificationsFuture]);

    List<NotificationsModel> notificationList = [];

    final generalNotificationSnapshot = results[1];
    if (generalNotificationSnapshot.docs.isNotEmpty) {
      for (var doc in generalNotificationSnapshot.docs) {
        notificationList.add(NotificationsModel(
          notificationsId: doc['notificationId'],
          notificationTypeId: doc['notificationTypeId'],
          notificationTitle: doc['notificationTitle'],
          notificationDate: doc['notificationDate'],
          notification: doc['notification'],
          listingsId: doc['listingsId'],
        ));
      }
    }

    final notificationSnapshot = results[0];
    if (notificationSnapshot.docs.isNotEmpty) {
      for (var doc in notificationSnapshot.docs) {
        notificationList.add(NotificationsModel(
          notificationsId: doc['notificationId'],
          notificationTypeId: doc['notificationTypeId'],
          notificationTitle: doc['notificationTitle'],
          notificationDate: doc['notificationDate'],
          notification: doc['notification'],
          listingsId: doc['listingsId'],
        ));
      }
    }

    setState(() {
      _notificationData = notificationList;
      _isLoading = false;
    });
  }

  List<NotificationsModel> get _filteredNotifications {
    List<NotificationsModel> filtered = _notificationData;

    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      filtered = filtered.where((notification) {
        return notification.notificationTitle
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return filtered;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: Center(
          child: Container(
            width: MyUtility(context).width * 0.75,
            height: MyUtility(context).height * 0.9,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Admin Notifications',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.48,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconSearchBox(
                        onChanged: _onSearchChanged,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Container(
                      width: MyUtility(context).width * 0.73,
                      height: MyUtility(context).height * 0.06,
                      decoration: ShapeDecoration(
                        color: Color(0xFF00437B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.64,
                              child: Text(
                                'Notification Title',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.96,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              'Read More',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.96,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : _filteredNotifications.isEmpty
                            ? const Text('No Notifications found')
                            : ListView.builder(
                                itemCount: _filteredNotifications.length,
                                itemBuilder: (context, index) {
                                  final notification = _notificationData[index];
                                  return NotificationTitle(
                                    notificationTitle: limitString(
                                        notification.notificationTitle, 40),
                                    year: notification.notificationDate!
                                        .toDate()
                                        .year
                                        .toString(),
                                    month: notification.notificationDate!
                                        .toDate()
                                        .month
                                        .toString(),
                                    day: notification.notificationDate!
                                        .toDate()
                                        .day
                                        .toString(),
                                  );
                                },
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
