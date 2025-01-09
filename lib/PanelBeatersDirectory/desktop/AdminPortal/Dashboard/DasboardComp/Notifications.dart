import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/notifications.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class Notifications extends StatefulWidget {
  final String notification;
  final String date;

  const Notifications(
      {super.key, required this.notification, required this.date});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.5),
      child: Container(
        width: widthDevice,
        height: 40.8,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.notification,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widthDevice < 1500 ? 10.88 : 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Text(
                widget.date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: widthDevice < 1500 ? 10.88 : 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset('images/dasharrow.svg'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
