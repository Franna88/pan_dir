import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/NotificationFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/NotificationTitleAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/confirmDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/formatUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import 'NotificationNavigator/NotificationButton.dart';
import 'NotificationsComp/icons/NotificationDelete.dart';
import 'NotificationsComp/icons/NotificationRefresh.dart';
import 'NotificationsComp/icons/selectall.dart';

class AdminNotificationsAlt extends StatefulWidget {
  final Function(int) navigateToPage;
  Function(NotificationsModel) getQuoteDetails;
  AdminNotificationsAlt(
      {super.key, required this.navigateToPage, required this.getQuoteDetails});

  @override
  State<AdminNotificationsAlt> createState() => _AdminNotificationsAltState();
}

class _AdminNotificationsAltState extends State<AdminNotificationsAlt> {
  final _firestore = FirebaseFirestore.instance;
  List<NotificationsModel> _notificationData = [];
  List<bool> isSelectedList = [];
  String _searchQuery = '';
  String membershipType = '';
  bool _isLoading = true;

  @override
  void initState() {
    _fetchNotificationData();
    super.initState();
  }

  void _fetchNotificationData() async {
    if (_isLoading == false) {
      setState(() {
        _isLoading = true;
      });
    }

    StoredUser? user = await getUserInfo();

    if (user == null) {
      return;
    }

    final notificationsFuture = _firestore
        .collection('notificationMessages')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .where('type', isEqualTo: "Quote")
        .orderBy('date', descending: true)
        .get();

    /* final generalNotificationsFuture = _firestore
        .collection('notifications')
        .where('listingsId', isEqualTo: 0)
        .orderBy('notificationDate', descending: true)
        .get();*/

    // Run both queries in parallel
    List<QuerySnapshot<Map<String, dynamic>>> results =
        await Future.wait([notificationsFuture]);

    List<NotificationsModel> notificationList = [];

    /*  final generalNotificationSnapshot = results[1];
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
    }*/

    final notificationSnapshot = results[0];
    if (notificationSnapshot.docs.isNotEmpty) {
      for (var doc in notificationSnapshot.docs) {
        isSelectedList.add(false);
        notificationList.add(NotificationsModel(
          notificationsId: doc['id'],
          notificationTypeId: doc['type'],
          notificationTitle: doc['title'],
          data: doc['data'],
          notificationDate: doc['date'],
          notification: doc['data.message'],
          personInterested: "${doc['data.name']} ${doc['data.surname']}",
          make: doc['data.make'],
          listingsId: doc['listingsId'],
          read: doc['read'],
        ));
      }
    }

    setState(() {
      _notificationData = notificationList;
      _isLoading = false;
      membershipType = user.membershipType;
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

  void onSelectAll(bool? value) {
    setState(() {
      if (value != null) {
        isSelectedList = isSelectedList.map((el) => el = value).toList();
      }
    });
  }

  Future<void> removeAllSelectedNotifications() async {
    for (int index = 0; index < isSelectedList.length; index++) {
      if (isSelectedList[index]) {
        removeSelectedNotifications(index);
      }
    }
  }

  void removeSelectedNotifications(int index) async {
    print('deleting... $index');
    try {
      await _firestore
          .collection('notificationMessages')
          .doc(_filteredNotifications[index].notificationsId)
          .delete();
      setState(() {
        _filteredNotifications.removeAt(index);
      });
    } catch (e) {
      print('Error deleting notification: $e');
    }
  }

  @override
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFF171616)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 0),
          child: Column(
            children: [
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.82,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.57, -0.82),
                    end: Alignment(-0.57, 0.82),
                    colors: [
                      Color(0x19777777),
                      Colors.white.withOpacity(0.4000000059604645)
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: MyUtility(context).width * 0.75,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: NotificationSearch(
                            onChanged: _onSearchChanged,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MyUtility(context).width * 0.75,
                        height: MyUtility(context).height * 0.7,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Row(
                                children: [
                                  Selectall(
                                    onSelected: onSelectAll,
                                  ),
                                  NotificationRefresh(
                                    refresh: _fetchNotificationData,
                                  ),
                                  NotificationDelete(
                                    iconColor: Color(0xFF757575),
                                    onSelected: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: ConfirmDialog(
                                              description:
                                                  "Are you sure you want to delete all notifications?",
                                              onConfirm:
                                                  removeAllSelectedNotifications,
                                              onCancel: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Container(
                                width: MyUtility(context).width * 0.73,
                                height: MyUtility(context).height * 0.06,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      NotificationButton(
                                        text: 'Quotation Requests',
                                        iconColor: Color(0xFFEF9040),
                                        icon: Icons.people,
                                        isSelected: _currentPage == 4,
                                        onPressed: () {
                                          widget.navigateToPage(4);
                                        },
                                      ),
                                      NotificationButton(
                                        text: 'System Alerts',
                                        icon: Icons.info,
                                        iconColor: Color(0xFF757575),
                                        isSelected: _currentPage == 5,
                                        onPressed: () {
                                          widget.navigateToPage(5);
                                        },
                                      ),
                                      NotificationButton(
                                        text: 'Documents Expired',
                                        icon: Icons.note_add_outlined,
                                        iconColor: Color(0xFF757575),
                                        isSelected: _currentPage == 6,
                                        onPressed: () {
                                          widget.navigateToPage(6);
                                        },
                                      ),
                                      NotificationButton(
                                        text: 'Customer Reviews',
                                        icon: Icons.star_border_rounded,
                                        iconColor: Color(0xFF757575),
                                        isSelected: _currentPage == 7,
                                        onPressed: () {
                                          widget.navigateToPage(7);
                                        },
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
                                  : !membershipType.contains("Premium")
                                      ? const Text(
                                          'You don\'t have access to this feature! Please upgrade your plan')
                                      : _filteredNotifications.isEmpty
                                          ? const Text('No Notifications found')
                                          : DraggableScrollbar.rrect(
                                              controller: _scrollController,
                                              backgroundColor:
                                                  Color(0x7F9E9E9F),
                                              alwaysVisibleScrollThumb: true,
                                              child: ListView.builder(
                                                controller: _scrollController,
                                                itemCount:
                                                    _filteredNotifications
                                                        .length,
                                                itemBuilder: (context, index) {
                                                  final notification =
                                                      _filteredNotifications[
                                                          index];
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 16,
                                                            right: 16),
                                                    child: NotificationTitleAlt(
                                                      type: "Quote",
                                                      message: notification
                                                          .notification,
                                                      read: notification.read!,
                                                      onPress: () {
                                                        widget.getQuoteDetails(
                                                            notification);
                                                        widget
                                                            .navigateToPage(16);
                                                      },
                                                      notificationTitle:
                                                          limitString(
                                                              notification
                                                                  .notificationTitle,
                                                              40),
                                                      year: notification
                                                          .notificationDate!
                                                          .toDate()
                                                          .year
                                                          .toString(),
                                                      month: notification
                                                          .notificationDate!
                                                          .toDate()
                                                          .month
                                                          .toString(),
                                                      day: notification
                                                          .notificationDate!
                                                          .toDate()
                                                          .day
                                                          .toString(),
                                                      personInterested:
                                                          notification
                                                              .personInterested!,
                                                      make: notification.make!,
                                                      isSelected:
                                                          isSelectedList[index],
                                                      onSelected:
                                                          (bool? value) {
                                                        if (value == null) {
                                                          return;
                                                        }
                                                        setState(
                                                          () {
                                                            isSelectedList[
                                                                index] = value;
                                                          },
                                                        );
                                                      },
                                                      onDelete: () {
                                                        removeSelectedNotifications(
                                                            index);
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                            ),
                            NotificationFooter()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
