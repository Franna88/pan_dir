import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationsComp/icons/NotificationDelete.dart';
import 'package:webdirectories/myutility.dart';

import 'icons/LabelImportant.dart';
import 'icons/NotificationLetter.dart';
import 'icons/NotificationSelect.dart';
import 'icons/NotificationStar.dart';
import 'icons/NotificationTimeIcon.dart';

class NotificationTitleAlt extends StatefulWidget {
  final bool read;
  final String notificationTitle;
  final String year;
  final String month;
  final String day;
  final String personInterested;
  final String make;
  final String type;
  final double? rate;
  final String? message;
  final VoidCallback onPress;
  final bool isSelected;
  final Function(bool?) onSelected;
  final Function onDelete;

  const NotificationTitleAlt(
      {super.key,
      required this.read,
      required this.notificationTitle,
      required this.year,
      required this.month,
      required this.day,
      required this.personInterested,
      required this.make,
      required this.type,
      required this.isSelected,
      required this.onSelected,
      required this.onDelete,
      this.rate,
      this.message,
      required this.onPress});

  @override
  State<NotificationTitleAlt> createState() => _NotificationTitleAltState();
}

class _NotificationTitleAltState extends State<NotificationTitleAlt> {
  bool _isTextBold = false;

  void _handleStarChanged(bool isStarred) {
    setState(() {
      _isTextBold = isStarred;
    });
  }

  void _toggleSelection() {
    // setState(() {
    //   widget.isSelected = !widget.isSelected;
    // });
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (widget.type == "Documents")
              SizedBox(
                width: MyUtility(context).width * 0.55,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
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
                          Text(
                            widget.make,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Please Update",
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            if (widget.type == "Reviews")
              SizedBox(
                width: MyUtility(context).width * 0.65,
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
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
                          Text(
                            widget.rate == 1
                                ? 'Angry | '
                                : widget.rate! < 3
                                    ? 'Good | '
                                    : 'Great |',
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                          Text(
                            '${widget.personInterested} | ',
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'raleway',
                            ),
                          ),
                          Text(
                            widget.notificationTitle,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.type == "Quote")
              SizedBox(
                width: MyUtility(context).width * 0.65,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
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
                          Text(
                            widget.personInterested,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  _isTextBold ? 'ralewaybold' : 'raleway',
                            ),
                          ),
                          Text(
                            widget.notificationTitle,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Text(
                            'Make -   ',
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  widget.read ? 'raleway' : 'ralewaybold',
                            ),
                          ),
                          Text(
                            widget.make,
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily: 'raleway',
                            ),
                          ),
                          Text(
                            " ${widget.message!}",
                            style: TextStyle(
                              color: widget.isSelected
                                  ? Colors.white
                                  : Color(0xFF202124),
                              fontSize: 14.54,
                              fontFamily:
                                  widget.read ? 'raleway' : 'ralewaybold',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              flex: 2,
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
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.type == "Documents")
                          AddButton(text: 'Update Now', onPressed: () {}),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${widget.day}/${widget.month}/${widget.year}',
                          style: TextStyle(
                            color: Color(0xFF202124),
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
    );
  }
}
