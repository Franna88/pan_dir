import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/SuperAdmin/newMemberships/models/NewApplicationModel.dart';
import 'package:webdirectories/SuperAdmin/newMemberships/ui/newApplicationDialog.dart';
import 'package:webdirectories/SuperAdmin/newMemberships/ui/newMembershipsContainer.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';

class NewMemberships extends StatefulWidget {
  const NewMemberships({super.key});

  @override
  State<NewMemberships> createState() => _NewMembershipsState();
}

class _NewMembershipsState extends State<NewMemberships> {
  String _searchQuery = "";

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

  @override
  Widget build(BuildContext context) {
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
                                'Listing Name',
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
                                'Date Added',
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
                                'Membership',
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
                                'Email',
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
                                'Contact',
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
                                'Data',
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
                        .collection('listings')
                        .orderBy('dateAdded', descending: true)
                        .where('pendingApproval', isEqualTo: 1)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return SelectableText(
                            'Error: snapshot error ${snapshot.error}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold));
                      }
                      if (!snapshot.hasData) {
                        return const Text('Loading...',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold));
                      }

                      final List<DocumentSnapshot> documents =
                          snapshot.data!.docs;
                      if (documents.isEmpty) {
                        return Center(
                            child: Text('No data yet',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)));
                      }

                      return Container(
                        color: Colors.transparent,
                        width: MyUtility(context).width -
                            (MyUtility(context).width * 0.25),
                        height: 410,
                        //color: Colors.transparent,
                        child: ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            final DocumentSnapshot document = documents[index];
                            final NewApplicationModel dataModel =
                                NewApplicationModel.fromMap(
                                    document.data() as Map<String, dynamic>);
                            return Visibility(
                              visible: getSearchValue(document),
                              child: NewMembershipsContainer(
                                membershipData: NewMembershipData(
                                    listingName: document['tradingName'],
                                    dateAdded: DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(
                                            (document['dateAdded'] as Timestamp)
                                                .toDate()
                                                .toString())),
                                    membershipType: document['membershipType'],
                                    phoneNumber: document['businessTelephone'],
                                    email: document['businessEmail']),
                                isEven: index % 2 == 0,
                                onViewTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: Color(0xFF181B1D),
                                        child: NewApplicationDialog(
                                          data: dataModel,
                                          closeDialog: () =>
                                              Navigator.pop(context),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onDeleteTap: () {},
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
