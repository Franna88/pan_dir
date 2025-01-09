import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationDelete.dart';
import 'package:webdirectories/myutility.dart';

import '../NotificationsComp/icons/LabelImportant.dart';
import '../NotificationsComp/icons/NotificationLetter.dart';
import '../NotificationsComp/icons/NotificationSelect.dart';
import '../NotificationsComp/icons/NotificationStar.dart';
import '../NotificationsComp/icons/NotificationTimeIcon.dart';

class SystemAlertContainer extends StatefulWidget {
  final VoidCallback onPress;
  final Function() onDelete;
  final bool isSelected;
  final Function(bool?) onSelected;
  final String notificationTitle;
  final String year;
  final String month;
  final String day;

  const SystemAlertContainer({
    super.key,
    required this.onPress,
    required this.onDelete,
    required this.onSelected,
    required this.isSelected,
    required this.notificationTitle,
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  State<SystemAlertContainer> createState() => _SystemAlertContainerState();
}

class _SystemAlertContainerState extends State<SystemAlertContainer> {
  bool _isTextBold = false;

  void _handleStarChanged(bool isStarred) {
    setState(() {
      _isTextBold = isStarred;
    });
  }

  void _toggleSelection() {
    widget.onSelected(!widget.isSelected);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection, // Toggle selection on tap
      child: Container(
        height: MyUtility(context).height * 0.05,
        decoration: BoxDecoration(
          color: widget.isSelected ? Color(0xFFEF9040) : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.5400000214576721),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MyUtility(context).width * 0.65,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        NotificationSelect(
                          onSelected: widget.onSelected,
                          isSelected: widget.isSelected,
                          boxColor: widget.isSelected
                              ? Colors.white
                              : Color(0xFF757575),
                        ),
                        NotificationStar(
                          onStarChanged: _handleStarChanged,
                          iconColor: widget.isSelected
                              ? Colors.white
                              : Color(0xFF757575),
                          iconColorChange: widget.isSelected
                              ? Colors.white
                              : Color(0xFFEF9040),
                        ),
                        LabelImportant(
                          iconColorChange: widget.isSelected
                              ? Colors.white
                              : Color(0xFFEF9040),
                          iconColor: widget.isSelected
                              ? Colors.white
                              : Color(0xFF757575),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 11,
                    child: Row(
                      children: [
                        Text(
                          'Welcome to the Panel Beater Directory! ',
                          style: TextStyle(
                            color: widget.isSelected
                                ? Colors.white
                                : Color(0xFF202124),
                            fontSize: 14.54,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                        Text(
                          widget.notificationTitle,
                          style: TextStyle(
                            color: widget.isSelected
                                ? Colors.white
                                : Color(0xFF202124),
                            fontSize: 14.54,
                            fontFamily: 'raleway',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: widget.isSelected
                  ? Row(
                      children: [
                        NotificationDelete(
                          iconColor: Colors.white,
                          onSelected: widget.onDelete,
                        ),
                        NotificationLetter(
                          iconColor: Colors.white,
                          onPress: widget.onPress,
                        ),
                        NotificationTimeIcon(iconColor: Colors.white),
                      ],
                    )
                  : Text(
                      '${widget.day}/${widget.month}/${widget.year}',
                      style: TextStyle(
                        color: Color(0xFF202124),
                        fontSize: 14.54,
                        fontFamily: 'raleway',
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
