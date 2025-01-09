import 'dart:typed_data';

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
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';

import '../../PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBox.dart';
import 'ui/lightStoneContainer.dart';

class LightStoneExcelProcess extends StatefulWidget {
  const LightStoneExcelProcess({super.key});

  @override
  State<LightStoneExcelProcess> createState() => _LightStoneExcelProcessState();
}

class _LightStoneExcelProcessState extends State<LightStoneExcelProcess> {
  final _firestore = FirebaseFirestore.instance;
  var excelData = [];
  var selectedExcel;
  var uploadStatus = "";
  final search = TextEditingController();
  String _searchQuery = '';
//remove old data in Firebase
  removeOldData() {
    setState(() {
      uploadStatus = "Removing old Data...";
    });
    _firestore.collection('lightstone').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
      ;
    });
  }

//Upload excel data to firebase
  uploadDataToFirebase() async {
    //  await removeOldData();
    setState(() {
      uploadStatus = "Uploading data ...";
      for (var doc in excelData) {
        _firestore.collection('lightstone').add(doc);
      }

      uploadStatus = "Finished Uploading Data";
    });
  }

//select excel file
  void _pickFiles() async {
    try {
      excelData.clear();
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        Uint8List file = result.files.first.bytes!;
        var excel = Excel.decodeBytes(file);

        selectedExcel = excel;

        print(excel['1 month'].maxColumns); // 52
        print(excel['1 month'].maxRows); //2

        for (var row in excel['1 month'].rows) {
          for (int colAmount = 0; colAmount < 52; colAmount++) {}
          setState(() {
            excelData.add({
              "brid": (row[0]?.value.toString()),
              "mbrCompanyName": row[1]?.value.toString(),
              "mbrTradingName": row[2]?.value.toString(),
              "mbrBusinessRegistrationNumber": row[3]?.value.toString(),
              "contactNumber": row[4]?.value.toString(),
              "addr1": row[5]?.value.toString(),
              "suburb": row[6]?.value.toString(),
              "city": row[7]?.value.toString(),
              "provName": row[8]?.value.toString(),
              "contactType": row[9]?.value.toString(),
              "category": row[10]?.value.toString(),
              "keyAttIndex": row[11]?.value.toString(),
              "advocacy": row[12]?.value.toString(),
              "frft": row[13]?.value.toString(),
              "rot": row[14]?.value.toString(),
              "keptInformed": row[15]?.value.toString(),
              "staff": row[16]?.value.toString(),
              "repairQuality": row[17]?.value.toString(),
              "opportunityToInspect": row[18]?.value.toString(),
              "vehicleCleanliness": row[19]?.value.toString(),
              "audi": row[20]?.value.toString(),
              "bmwApproved": row[21]?.value.toString(),
              "chery": row[22]?.value.toString(),
              "chryster": row[23]?.value.toString(),
              "citroen": row[24]?.value.toString(),
              "datsun": row[25]?.value.toString(),
              "flatApproved": row[26]?.value.toString(),
              "fordApproved": row[27]?.value.toString(),
              "gmApproved": row[28]?.value.toString(),
              "havalApproved": row[29]?.value.toString(),
              "hondaApproved": row[30]?.value.toString(),
              "hyndaiApproved": row[31]?.value.toString(),
              "infinity": row[32]?.value.toString(),
              "isuzu": row[33]?.value.toString(),
              "landRover": row[34]?.value.toString(),
              "kia": row[35]?.value.toString(),
              "lexus": row[36]?.value.toString(),
              "mahindra": row[37]?.value.toString(),
              "mazda": row[38]?.value.toString(),
              "mbsaPassenger": row[39]?.value.toString(),
              "mitsubishi": row[40]?.value.toString(),
              "nissanApproved": row[41]?.value.toString(),
              "opel": row[42]?.value.toString(),
              "peugeot/citroen": row[43]?.value.toString(),
              "renault": row[44]?.value.toString(),
              "stellantis": row[45]?.value.toString(),
              "subaru": row[46]?.value.toString(),
              "suzuki": row[47]?.value.toString(),
              "tata": row[48]?.value.toString(),
              "toyota": row[49]?.value.toString(),
              "volvo": row[50]?.value.toString(),
              "volkswagen": row[51]?.value.toString(),
            });
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick files: $e')),
      );
    }
  }

  getSearchValue(document) {
    if ((_searchQuery) == "") {
      return true;
    } else if ((_searchQuery.toLowerCase())
            .contains(document['mbrCompanyName'].toLowerCase()) ||
        (_searchQuery.toLowerCase()).contains(document['brid'].toLowerCase()) ||
        (_searchQuery.toLowerCase())
            .contains(document['mbrTradingName'].toLowerCase())) {
      return true;
    } else {
      return false;
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
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
                    children: [
                      AddButton(
                        text: 'Upload Excel Document',
                        onPressed: () {
                          _pickFiles();
                        },
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Visibility(
                        visible: excelData.length >= 1,
                        child: AddButton(
                          text: 'Upload to DB',
                          onPressed: () {
                            uploadDataToFirebase();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        uploadStatus,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.24,
                          fontFamily: 'raleway',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconSearchBox(
                        onChanged: _onSearchChanged,
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
                              flex: 1,
                              child: Text(
                                'BRID',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'COMPANY NAME',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                'TRADING NAME',
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
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('lightstone')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: snapshot error');
                        }
                        if (!snapshot.hasData) {
                          return const Text('Loading...');
                        }

                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        if (documents.isEmpty) {
                          return Center(child: Text('No data yet'));
                        }
                        print("LENGTH");
                        print(documents.length);
                        return Container(
                            color: Colors.transparent,
                            width: MyUtility(context).width -
                                (MyUtility(context).width * 0.25),
                            height: 410,
                            //color: Colors.transparent,
                            child: ListView.builder(
                                itemCount: documents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final DocumentSnapshot document =
                                      documents[index];
                                  return Visibility(
                                    visible: getSearchValue(document),
                                    child: lightStoneContainer(
                                      brid: document['brid'],
                                      companyName: document['mbrCompanyName'],
                                      tradingName: document['mbrTradingName'],
                                      isEven: index % 2 == 0,
                                    ),
                                  );
                                }));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
