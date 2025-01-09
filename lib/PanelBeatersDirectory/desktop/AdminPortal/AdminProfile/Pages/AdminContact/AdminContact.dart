import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdminContactContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/NewTeamMemberAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/ContactPopup/ContactPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AdminContact extends StatefulWidget {
  const AdminContact({super.key});

  @override
  State<AdminContact> createState() => _AdminContactState();
}

class _AdminContactState extends State<AdminContact> {
  List<Map<String, dynamic>> _contactInfo = [];
  final _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> _fetchContactData() async {
    StoredUser? user = await getUserInfo();

    if (user == null) {
      return [];
    }

    QuerySnapshot contactSnapshot = await _firestore
        .collection('contact_person')
        .where('listingsId', isEqualTo: int.parse(user.id))
        .get();

    if (contactSnapshot.docs.isNotEmpty) {
      List<Map<String, dynamic>> contactData = contactSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      return contactData;
    } else {
      return [
        {
          'contactPersonDesignation': 'Administrator',
          'contactPerson': 'Samantha Sheingold',
          'contactPersonCell': '0123464690',
          'contactPersonEmail': 'samantha@webdirectories.co.za',
        },
      ];
    }
  }

  void _updateContactData(Map<String, dynamic> newContact) {
    List<Map<String, dynamic>> contactData = _contactInfo;
    contactData.add(newContact);
    setState(() {
      _contactInfo = contactData;
    });
  }

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
        Text(
          'Contacts',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.48,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconSearchBoxB(
              search: TextEditingController(),
            ),
            AddButton(
              text: 'Insert Contact',
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: Colors.transparent,
                      insetPadding: EdgeInsets.all(10),
                      child: ContactPopup(
                        onAddContact: _updateContactData,
                        refreshList: () {
                          setState(() {});
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15),
          child: Container(
            width: MyUtility(context).width * 0.9,
            height: MyUtility(context).height * 0.065,
            decoration: ShapeDecoration(
              color: Color(0xFF0F253A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.195,
                    child: Text(
                      'Type',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.68,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.195,
                    child: Text(
                      'Contact Person',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.68,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.12,
                    child: Text(
                      'Phone',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.68,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.25,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.68,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: heightDevice,
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchContactData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No contact persons found'));
                  } else {
                    final contactInfo = snapshot.data!;
                    return ListView.builder(
                      itemCount: contactInfo.length,
                      itemBuilder: (context, index) {
                        final contact = contactInfo[index];
                        return AdminContactContainer(
                          type: contact['contactPersonDesignation'],
                          contactPerson: contact['contactPerson'],
                          phone: contact['contactPersonCell'],
                          email: contact['contactPersonEmail'],
                          pressEdit: () {},
                          PressDelete: () {},
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
