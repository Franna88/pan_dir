import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/RegistrationAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/Registrationcontainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsDelete.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/RegistrationPopup/RegistrationPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../../components/descriptionDialog.dart';

class RegistrationAlit extends StatefulWidget {
  Function getListingId;
  RegistrationAlit({super.key, required this.getListingId});

  @override
  State<RegistrationAlit> createState() => _RegistrationAlitState();
}

class _RegistrationAlitState extends State<RegistrationAlit> {
  List<Map<String, dynamic>> _registrationInfo = []; // Original data
  final _firestore = FirebaseFirestore.instance;
  final searchController = TextEditingController();
  String searchText = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRegistrationData().then((data) {
      setState(() {
        _registrationInfo = data;
        _isLoading = false;
      });
    });
  }

  Future<List<Map<String, dynamic>>> _fetchRegistrationData() async {
    StoredUser? user = await getUserInfo();

    try {
      var userId = await widget.getListingId();
      // Fetch the registration numbers related to the listing
      QuerySnapshot registrationSnapshot = await _firestore
          .collection('registration_numbers')
          .where('listingsId', isEqualTo: userId)
          .get();

      if (registrationSnapshot.docs.isEmpty) return [];

      List<Map<String, dynamic>> registrationData =
          registrationSnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id; // Add Firestore document ID here
        return data;
      }).toList();

      // Fetch and map registration types (already present in your code)
      Set<int?> registrationTypeIds = registrationData
          .map((registration) => registration['registrationTypeId'] as int?)
          .toSet();

      registrationTypeIds.removeWhere((i) => i == null);

      QuerySnapshot registrationTypeSnapshot = await _firestore
          .collection('registration_type')
          .where('registrationTypeId', whereIn: registrationTypeIds)
          .get();

      Map<int, Map<String, dynamic>> registrationTypeMap = {
        for (var doc in registrationTypeSnapshot.docs)
          doc['registrationTypeId']: {
            'type': doc['registrationType'],
            'show': doc['registrationShow'],
          }
      };

      for (var registration in registrationData) {
        int? registrationTypeId = registration['registrationTypeId'];

        if (registrationTypeId != null &&
            registrationTypeMap.containsKey(registrationTypeId)) {
          registration['registrationType'] =
              registrationTypeMap[registrationTypeId]!['type'];
          registration['displayProfile'] =
              registrationTypeMap[registrationTypeId]!['registrationDisplay'] ==
                      1
                  ? 'Yes'
                  : 'No';
        }
      }
      print(registrationData);
      return registrationData;
    } catch (e) {
      print(e);
    }

    return [];
  }

  void updateRegistrationNumbersOnAdd(Map<String, dynamic> newRegistration) {
    List<Map<String, dynamic>> regData = _registrationInfo;
    regData.add(newRegistration);
    setState(() {
      _registrationInfo = regData;
    });
  }

  void updateRegistrationNumber(
      String id, Map<String, dynamic> newRegistration) {
    // print(id);
    // List<Map<String, dynamic>> regData = _registrationInfo;
    // int index = regData.indexWhere((item) => item['id'] == id);
    // regData[index] = newRegistration;
    // setState(() {
    //   _registrationInfo = regData;
    // });
  }

  removeRegItem(docId) {
    FirebaseFirestore.instance
        .collection('registration_numbers')
        .doc(docId)
        .delete()
        .whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration number removed successfully'),
        ),
      );
      setState(() {});
      Navigator.pop(context);
    });
  }

  @override
  final ScrollController _scrollController = ScrollController();

  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: MyUtility(context).width * 0.9,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Container(
            width: MyUtility(context).width * 0.9,
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
                        text: 'Insert New Record',
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(10),
                                child: RegistrationPopup(
                                  onAddRegistration:
                                      updateRegistrationNumbersOnAdd,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconSearchBoxB(
                        onSearch: (String? value) {
                          setState(() {
                            searchText = value ?? '';
                          });
                        },
                        search: searchController,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Container(
                      width: MyUtility(context).width * 0.9,
                      height: MyUtility(context).height * 0.065,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Registration Type',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Registration Number',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                'Display on Business Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightDevice * 0.5,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: _fetchRegistrationData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          return Center(child: Text('No registrations found'));
                        } else {
                          final registrationInfo = snapshot.data!;
                          return DraggableScrollbar.rrect(
                            controller: _scrollController,
                            backgroundColor: Color(0x7F9E9E9F),
                            alwaysVisibleScrollThumb: true,
                            child: ListView.builder(
                              controller:
                                  _scrollController, // Make sure this controller is initialized
                              itemCount: registrationInfo.length,
                              itemBuilder: (context, index) {
                                final registration = registrationInfo[index];
                                // Determine whether the item matches the search query
                                final filteredRegistrations =
                                    registrationInfo.where((registration) {
                                  return registration['registrationType']
                                          ?.toLowerCase()
                                          .contains(searchText) ??
                                      false ||
                                          (registration[
                                                      'registrationNumbers'] !=
                                                  null &&
                                              registration[
                                                      'registrationNumbers']
                                                  .toString()
                                                  .contains(searchText));
                                }).toList();
                                return Column(
                                  children: [
                                    Visibility(
                                      visible: filteredRegistrations.isEmpty &&
                                          index == 0,
                                      child: Center(
                                        child: Text(
                                          'No matching records found',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: filteredRegistrations.isNotEmpty,
                                      child: RegistrationAltContainer(
                                        registrationType:
                                            registration['registrationType']!,
                                        registrationNumber:
                                            registration['registrationNumbers']!
                                                .toString(),
                                        displayProfile: registration[
                                                    'registrationDisplay']! ==
                                                1
                                            ? 'Yes'
                                            : 'No',
                                        pressEdit: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    EdgeInsets.all(10),
                                                child: RegistrationPopup(
                                                  existingRegistration:
                                                      registration, // Now contains the document ID
                                                  onAddRegistration:
                                                      (updatedRegistration) {
                                                    setState(() {
                                                      // Update the list with new values
                                                      registrationInfo[index] =
                                                          updatedRegistration;
                                                    });
                                                  },
                                                  onUpdateRegistration:
                                                      updateRegistrationNumber,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        pressDelete: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    EdgeInsets.all(10),
                                                child: PopUpsDeleteEntry(
                                                  onDelete: () {
                                                    removeRegItem(
                                                        registrationInfo[index]
                                                            ['id']); /* */
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        isEven: index % 2 == 0,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }
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
