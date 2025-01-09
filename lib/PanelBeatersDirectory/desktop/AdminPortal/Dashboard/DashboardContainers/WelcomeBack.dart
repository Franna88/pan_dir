import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashboardButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class WelcomeBack extends StatefulWidget {
  const WelcomeBack({super.key});

  @override
  State<WelcomeBack> createState() => _WelcomeBackState();
}

class _WelcomeBackState extends State<WelcomeBack> {
  StoredUser? _user;
  final _firestore = FirebaseFirestore.instance;
  String _username = '';
  @override
  void initState() {
    _getUsername();
    super.initState();
  }

  void _getUsername() async {
    StoredUser? user = await getUserInfo();
    if (user != null) {
      setState(() {
        _username = user.fullName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: widthDevice < 1500 ? 225.8 : heightDevice * 0.25,
      width: widthDevice < 1500 ? 558.28 : widthDevice * 0.35,
      //width: ,
      //height: 225.08,
      decoration: ShapeDecoration(
        color: Color(0x3FEF9040),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.2,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              _username,
              style: TextStyle(
                color: Color(0xFFEF9040),
                fontSize: 21.76,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            DashboardButton(text: 'Industry News', onPressed: () {}),
            Row(
              children: [
                DashboardButton(text: 'Lightstone Results', onPressed: () {}),
                DashboardButton(
                    text: 'View Business Profile', onPressed: () {}),
                DashboardButton(text: 'Talk to Us', onPressed: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
