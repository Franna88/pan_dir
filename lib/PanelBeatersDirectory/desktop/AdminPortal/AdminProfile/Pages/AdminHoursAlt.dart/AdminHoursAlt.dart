import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/HoursReuseable/DaysButtonAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/HoursReuseable/HoursAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/DaysButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/Hours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../components/descriptionDialog.dart';

class AdminHoursAlt extends StatefulWidget {
  Function getListingId;
  AdminHoursAlt({super.key, required this.getListingId});

  @override
  State<AdminHoursAlt> createState() => _AdminHoursAltState();
}

class _AdminHoursAltState extends State<AdminHoursAlt> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final hRemarks = TextEditingController();
  Businessprofilehours? _listingHours;
  String docId = "";

  @override
  void initState() {
    super.initState();
    _fetchHoursData();
  }

  Future<void> _fetchHoursData() async {
    var listingsId = await widget.getListingId();

    QuerySnapshot hoursDoc = await _firestore
        .collection('listing_hours')
        .where('listingsId', isEqualTo: listingsId)
        .get();
    print("HOURS1");
    if (hoursDoc.docs.isNotEmpty) {
      print("HOURS");
      try {
        Map<String, dynamic> data =
            hoursDoc.docs.first.data() as Map<String, dynamic>;
        // set hours data
        setState(() {
          docId = hoursDoc.docs[0].id;
          _listingHours = Businessprofilehours.fromMap(data);
          hRemarks.text = hoursDoc.docs[0]['hRemarks'];
        });
      } catch (e) {
        print('Error fetching listing hours: $e');
      }
    }
  }

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  getValues(docId) async {
    return {
      'mOpen': _listingHours!.mOpen,
      'mClosed': _listingHours!.mClosed,
      'tOpen': _listingHours!.tOpen,
      'tClosed': _listingHours!.tClosed,
      'wClosed': _listingHours!.wClosed,
      'wOpen': _listingHours!.wOpen,
      'thOpen': _listingHours!.thOpen,
      'thClosed': _listingHours!.thClosed,
      'fOpen': _listingHours!.fOpen,
      'fClosed': _listingHours!.fClosed,
      'saOpen': _listingHours!.saOpen,
      'saClosed': _listingHours!.saClosed,
      'suOpen': _listingHours!.suOpen,
      'suClosed': _listingHours!.suClosed,
      'pOpen': _listingHours!.pOpen,
      'pClosed': _listingHours!.pClosed,
      'listingsId': await widget.getListingId(),
      'hRemarks': hRemarks.text
    };
  }

  updateHours() async {
    try {
      Map<String, dynamic> hoursData = await getValues(docId);

      print(hoursData);
      await _firestore
          .collection('listing_hours')
          .doc(docId)
          .update(hoursData)
          .whenComplete(() => descriptionDialog("Hours Data Saved"));
    } catch (e) {
      print('error updating hours: $e');
      descriptionDialog("Something went wrong. Try again");
    }
  }

  updateMonday(start, end) {
    setState(() {
      _listingHours!.mOpen = start;
      _listingHours!.mClosed = end;
    });

    Navigator.pop(context);
  }

  updateTuesday(start, end) {
    setState(() {
      _listingHours!.tOpen = start;
      _listingHours!.tClosed = end;
    });

    Navigator.pop(context);
  }

  updateWednesDay(start, end) {
    setState(() {
      _listingHours!.wOpen = start;
      _listingHours!.wClosed = end;
    });

    Navigator.pop(context);
  }

  updateThursday(start, end) {
    setState(() {
      _listingHours!.thOpen = start;
      _listingHours!.thClosed = end;
    });

    Navigator.pop(context);
  }

  updateFriday(start, end) {
    setState(() {
      _listingHours!.fOpen = start;
      _listingHours!.fClosed = end;
    });

    Navigator.pop(context);
  }

  updateSaturday(start, end) {
    setState(() {
      _listingHours!.saOpen = start;
      _listingHours!.saClosed = end;
    });

    Navigator.pop(context);
  }

  updateSunday(start, end) {
    setState(() {
      _listingHours!.suOpen = start;
      _listingHours!.suClosed = end;
    });

    Navigator.pop(context);
  }

  updatePublic(start, end) {
    setState(() {
      _listingHours!.pOpen = start;
      _listingHours!.pClosed = end;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.5, top: 12.5, left: 20),
          child: Text(
            'To maintain system security and reliability, please avoid uploading images or links in the Useful Information section. All posts are subject to moderation.',
            style: TextStyle(
              color: Color(0xFFD17226),
              fontSize: 13.7364,
              fontFamily: 'ralewaysemi',
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: MyUtility(context).width * 0.85,
              padding: const EdgeInsets.all(20.0),
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.57, -0.82),
                  end: Alignment(-0.57, 0.82),
                  colors: [
                    Color(0x19777777),
                    Colors.white.withOpacity(0.4),
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: InkWell(
                        onTap: () {
                          print(_listingHours!.mOpen);
                          setState(() {
                            _listingHours!.mOpen = "";
                          });
                        },
                        child: Text(
                          'Business Hours & Useful Information ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.6064,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MyUtility(context).width * 0.8,
                    //   height: MyUtility(context).height * 0.65,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MyUtility(context).width * 0.185,
                              ),
                              DaysButtonAlt(
                                day: 'M',
                                isSelected: _listingHours?.mOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.mOpen != 'closed') {
                                      _listingHours!.mOpen = "closed";
                                    } else {
                                      _listingHours!.mOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'T',
                                isSelected: _listingHours?.tOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.tOpen != 'closed') {
                                      _listingHours!.tOpen = "closed";
                                    } else {
                                      _listingHours!.tOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'W',
                                isSelected: _listingHours?.wOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.wOpen != 'closed') {
                                      _listingHours!.wOpen = "closed";
                                    } else {
                                      _listingHours!.wOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'T',
                                isSelected: _listingHours?.thOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.thOpen != 'closed') {
                                      _listingHours!.thOpen = "closed";
                                    } else {
                                      _listingHours!.thOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'F',
                                isSelected: _listingHours?.fOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.fOpen != 'closed') {
                                      _listingHours!.fOpen = "closed";
                                    } else {
                                      _listingHours!.fOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'S',
                                isSelected: _listingHours?.saOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.saOpen != 'closed') {
                                      _listingHours!.saOpen = "closed";
                                    } else {
                                      _listingHours!.saOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'S',
                                isSelected: _listingHours?.suOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.suOpen != 'closed') {
                                      _listingHours!.suOpen = "closed";
                                    } else {
                                      _listingHours!.suOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                              DaysButtonAlt(
                                day: 'P',
                                isSelected: _listingHours?.pOpen != 'closed',
                                onChange: () {
                                  setState(() {
                                    if (_listingHours?.pOpen != 'closed') {
                                      print("pOpen is closed");
                                      _listingHours!.pOpen = "closed";
                                    } else {
                                      print("pOpen is 08:00");
                                      _listingHours!.pOpen = "08:00";
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  10), // Add space between rows and time slots
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _listingHours?.mOpen != null &&
                                          _listingHours?.mOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Monday',
                                          from: _listingHours!.mOpen,
                                          till: _listingHours!.mClosed,
                                          onTimeChange: updateMonday)
                                      : SizedBox.shrink(),
                                  _listingHours?.tOpen != null &&
                                          _listingHours?.tOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Tuesday',
                                          from: _listingHours!.tOpen,
                                          till: _listingHours!.tClosed,
                                          onTimeChange: updateTuesday)
                                      : SizedBox.shrink(),
                                  _listingHours?.wOpen != null &&
                                          _listingHours?.wOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Wednesday',
                                          from: _listingHours!.wOpen,
                                          till: _listingHours!.wClosed,
                                          onTimeChange: updateWednesDay)
                                      : SizedBox.shrink(),
                                  _listingHours?.thOpen != null &&
                                          _listingHours?.thOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Thursday',
                                          from: _listingHours!.thOpen,
                                          till: _listingHours!.thClosed,
                                          onTimeChange: updateThursday)
                                      : SizedBox.shrink(),
                                  _listingHours?.fOpen != null &&
                                          _listingHours?.fOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Friday',
                                          from: _listingHours!.fOpen,
                                          till: _listingHours!.fClosed,
                                          onTimeChange: updateFriday)
                                      : SizedBox.shrink(),
                                  _listingHours?.saOpen != null &&
                                          _listingHours?.saOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Saturday',
                                          from: _listingHours!.saOpen,
                                          till: _listingHours!.saClosed,
                                          onTimeChange: updateSaturday)
                                      : SizedBox.shrink(),
                                  _listingHours?.suOpen != null &&
                                          _listingHours?.suOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Sunday',
                                          from: _listingHours!.suOpen,
                                          till: _listingHours!.suClosed,
                                          onTimeChange: updateSunday)
                                      : SizedBox.shrink(),
                                  _listingHours?.pOpen != null &&
                                          _listingHours?.pOpen != 'closed'
                                      ? HoursAlt(
                                          days: 'Public Holidays',
                                          from: _listingHours!.pOpen,
                                          till: _listingHours!.pClosed,
                                          onTimeChange: updatePublic)
                                      : SizedBox.shrink(),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: TextField(
                              controller: hRemarks,
                              maxLines: 5,
                              minLines: 3,
                              decoration: InputDecoration(
                                hintText: "Add more info",
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                              ),
                              style: TextStyle(
                                  color: Colors
                                      .white), // Set the input text color to white
                            ),
                          ),

                          Align(
                            alignment: Alignment.centerRight,
                            child: AddButton(
                                text: 'Save',
                                onPressed: () {
                                  updateHours();
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
