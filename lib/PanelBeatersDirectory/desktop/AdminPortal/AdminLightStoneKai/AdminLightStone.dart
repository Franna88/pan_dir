import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminLightStoneKai/LightStoneComp/AdminLightEco.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DashboardContainers/DashProfileView.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/LightStoneEcho/LightStoneEcho.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/LightStone/LightStone/WhoIsLightStone/WhoIsLightStone.dart';
import 'package:webdirectories/myutility.dart';

import '../../components/descriptionDialog.dart';
import 'LightStoneComp/AdminWhoIsLight.dart';

class AdminLightStone extends StatefulWidget {
  final dynamic data;
  final int listingsId;

  const AdminLightStone({super.key, this.data, required this.listingsId});

  @override
  State<AdminLightStone> createState() => _AdminLightStoneState();
}

class _AdminLightStoneState extends State<AdminLightStone> {
  var displayLightStoneData = false;
  final _firestore = FirebaseFirestore.instance;
  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  updateListData(description) async {
    QuerySnapshot userDoc = await _firestore
        .collection('listings')
        .where('listingsId', isEqualTo: widget.listingsId)
        .get();

    if (userDoc.docs.isNotEmpty) {
      _firestore
          .collection('listings')
          .doc(userDoc.docs[0].id)
          .update({"displayLightStone": displayLightStoneData}).whenComplete(
              () => descriptionDialog(description));
    }
  }

  getLightstonePermission() async {
    QuerySnapshot userDoc = await _firestore
        .collection('listings')
        .where('listingsId', isEqualTo: widget.listingsId)
        .get();

    if (userDoc.docs.isNotEmpty) {
      setState(() {
        if (userDoc.docs[0]['displayLightStone'] != null) {
          displayLightStoneData = userDoc.docs[0]['displayLightStone'];
        }
      });
    }
  }

  @override
  void initState() {
    getLightstonePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Cast or convert the data to Map<String, dynamic>
    final data = widget.data is Map
        ? Map<String, dynamic>.from(widget.data)
        : <String, dynamic>{}; // Fallback to empty map if casting fails

    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(color: Color(0xFF171616)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
          child: Column(
            children: [
              Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 0.85,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.57, -0.82),
                    end: const Alignment(-0.57, 0.82),
                    colors: [
                      const Color(0x19777777),
                      Colors.white.withOpacity(0.4),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0xBF000000),
                      blurRadius: 24,
                      offset: Offset(0, 4),
                      spreadRadius: -1,
                    )
                  ],
                ),
                child: Center(
                  child: Container(
                    width: MyUtility(context).width * 0.75,
                    height: MyUtility(context).height * 0.8,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF181B1D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  AdminLightEco(
                                    percentage: data.containsKey('keyAttIndex')
                                        ? data['keyAttIndex'].toString()
                                        : '50', // Default value if key is missing or data is null
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: displayLightStoneData,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            print(widget.listingsId);
                                            if (displayLightStoneData ==
                                                false) {
                                              displayLightStoneData = true;
                                              updateListData(
                                                  "Lightstone data will be displayed on profile");
                                            } else {
                                              displayLightStoneData = false;
                                              updateListData(
                                                  "Lightstone data will NOT be displayed on profile");
                                            }

                                            //  _isSelected = value ?? false;
                                          });
                                        },
                                        activeColor: Colors
                                            .transparent, // Remove default active color
                                        checkColor: Color(
                                            0xFFEF9040), // Inside color when selected

                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              2.0), // Square shape
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        'Click to display your result on business profile',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'raleway',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              AdminWhoisLight(
                                data: data,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
