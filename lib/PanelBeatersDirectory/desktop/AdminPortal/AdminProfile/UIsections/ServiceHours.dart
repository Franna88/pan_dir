import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/DaysButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/Hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class ServiceHours extends StatefulWidget {
  const ServiceHours({super.key});

  @override
  State<ServiceHours> createState() => _ServiceHoursState();
}

class _ServiceHoursState extends State<ServiceHours> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Businessprofilehours? _listingHours;

  @override
  void initState() {
    super.initState();
    _fetchHoursData();
  }

  Future<void> _fetchHoursData() async {
    StoredUser? user = await getUserInfo();

    String? lisitingId = user?.id;

    QuerySnapshot hoursDoc = await _firestore
        .collection('listing_hours')
        .where('listingsId', isEqualTo: int.parse(lisitingId!))
        .get();

    if (hoursDoc.docs.isNotEmpty) {
      try {
        Map<String, dynamic> data =
            hoursDoc.docs.first.data() as Map<String, dynamic>;
        // set hours data
        setState(() {
          _listingHours = Businessprofilehours.fromMap(data);
        });
      } catch (e) {
        print('Error fetching listing hours: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Hours',
                    style: TextStyle(
                      color: Color(0xFF0F253A),
                      fontSize: 20.4,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    DaysButton(
                      day: 'M',
                      isSelected: _listingHours?.mOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'T',
                      isSelected: _listingHours?.tOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'W',
                      isSelected: _listingHours?.wOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'T',
                      isSelected: _listingHours?.thOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'F',
                      isSelected: _listingHours?.fOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'S',
                      isSelected: _listingHours?.saOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'S',
                      isSelected: _listingHours?.suOpen != 'closed',
                    ),
                    DaysButton(
                      day: 'P',
                      isSelected: _listingHours?.pOpen != 'closed',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _listingHours?.mOpen != null &&
                            _listingHours?.mOpen != 'closed'
                        ? Hours(
                            days: 'Monday',
                            from: _listingHours!.mOpen,
                            till: _listingHours!.mClosed)
                        : SizedBox.shrink(),
                    _listingHours?.tOpen != null &&
                            _listingHours?.tOpen != 'closed'
                        ? Hours(
                            days: 'Tuesday',
                            from: _listingHours!.tOpen,
                            till: _listingHours!.tClosed)
                        : SizedBox.shrink(),
                    _listingHours?.wOpen != null &&
                            _listingHours?.wOpen != 'closed'
                        ? Hours(
                            days: 'Wednesday',
                            from: _listingHours!.wOpen,
                            till: _listingHours!.wClosed)
                        : SizedBox.shrink(),
                    _listingHours?.thOpen != null &&
                            _listingHours?.thOpen != 'closed'
                        ? Hours(
                            days: 'Thursday',
                            from: _listingHours!.thOpen,
                            till: _listingHours!.thClosed)
                        : SizedBox.shrink(),
                    _listingHours?.fOpen != null &&
                            _listingHours?.fOpen != 'closed'
                        ? Hours(
                            days: 'Friday',
                            from: _listingHours!.fOpen,
                            till: _listingHours!.fClosed)
                        : SizedBox.shrink(),
                    _listingHours?.saOpen != null &&
                            _listingHours?.saOpen != 'closed'
                        ? Hours(
                            days: 'Saturday',
                            from: _listingHours!.saOpen,
                            till: _listingHours!.saClosed)
                        : SizedBox.shrink(),
                    _listingHours?.suOpen != null &&
                            _listingHours?.suOpen != 'closed'
                        ? Hours(
                            days: 'Sunday',
                            from: _listingHours!.suOpen,
                            till: _listingHours!.suClosed)
                        : SizedBox.shrink(),
                    _listingHours?.pOpen != null &&
                            _listingHours?.pOpen != 'closed'
                        ? Hours(
                            days: 'Public Holidays',
                            from: _listingHours!.pOpen,
                            till: _listingHours!.pClosed)
                        : SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
