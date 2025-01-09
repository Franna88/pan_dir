import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';

import '../../PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import '../../PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import '../../PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/NewDeletePopUp.dart';
import '../../myutility.dart';
import 'ui/listingItemContainer.dart';

class Listings extends StatefulWidget {
  const Listings({super.key});

  @override
  State<Listings> createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final _firestore = FirebaseFirestore.instance;
  var countries = [];
  var province = [];
  var city = [];
  var suburb = [];

  final search = TextEditingController();

  String _searchQuery = '';

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

  void _fetchData() async {
    final futures = [
      _firestore.collection('country').get(),
      _firestore.collection('province').get(),
      _firestore.collection('city').get(),
      _firestore.collection('suburb').get(),
    ];
    // Wait for all futures to complete in parallel
    final results = await Future.wait(futures);

    QuerySnapshot<Map<String, dynamic>> countrySnapshot = results[0];
    QuerySnapshot<Map<String, dynamic>> provinceSnapshot = results[1];
    QuerySnapshot<Map<String, dynamic>> citySnapshot = results[2];
    QuerySnapshot<Map<String, dynamic>> suburbSnapshot = results[3];

    setState(() {
      countries = countrySnapshot.docs;
      province = provinceSnapshot.docs;
      city = citySnapshot.docs;
      suburb = suburbSnapshot.docs;
    });
  }

  getCountry(value) {
    /**/ int docIndex =
        countries.indexWhere((item) => item['countryId'] == value);
    if (docIndex == -1) {
      return "";
    } else {
      return countries[docIndex]['country'];
    }
  }

  getProvince(value) {
    int docIndex = province.indexWhere((item) => item['provinceId'] == value);
    if (docIndex == -1) {
      return "NO";
    } else {
      return province[docIndex]['province'];
    } /* */
  }

  getCity(value) {
    int docIndex = city.indexWhere((item) => item['cityId'] == value);
    if (docIndex == -1) {
      return "";
    } else {
      return city[docIndex]['city'];
    }
  }

  getSuburb(value) {
    int docIndex = suburb.indexWhere((item) => item['suburbId'] == value);
    if (docIndex == -1) {
      return "";
    } else {
      return suburb[docIndex]['suburb'];
    }
  }

  setListingAsInActive(id) {
    _firestore.collection('listings').doc(id).update({"isActive": 0});
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
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
                      child: Column(children: [
                        Row(
                          children: [
                            AddButton(
                              text: 'Insert New Record',
                              onPressed: () {},
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
                                      'Country',
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
                                      'Province',
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
                                      'City',
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
                                      'Suburb',
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
                                      'Status',
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
                                      'Featured',
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
                                      'SF',
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
                                .orderBy('title', descending: false)
                                .where('title', isNotEqualTo: "")
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Error: snapshot error',
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
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final DocumentSnapshot document =
                                            documents[index];
                                        return Visibility(
                                          visible: getSearchValue(document),
                                          child: Listingitemcontainer(
                                            tradingName: document['title'],
                                            membership: '1',
                                            country: getCountry(
                                                document['countryId']),
                                            province: getProvince(
                                                document['provinceId']),
                                            city: getCity(document['cityId']),
                                            suburb:
                                                getSuburb(document['suburbId']),
                                            status: document['isActive'] == 1
                                                ? "Active"
                                                : "InActive",
                                            featured:
                                                document['featured'].toString(),
                                            sf: '1',
                                            contact:
                                                document['businessTelephone'],
                                            isEven: index % 2 == 0,
                                            pressEdit: () {
                                              //Open owners portal

                                              showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  barrierColor: Colors.black
                                                      .withOpacity(0.5),
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog.fullscreen(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      child: AdminPortal(
                                                          listingsId: (document[
                                                                  'listingsId'])
                                                              .toString(),
                                                          normalUser: false),
                                                    );
                                                  });
                                            },
                                            pressDelete: () {
                                              // Open the delete confirmation dialog
                                              showDialog(
                                                context: context,
                                                barrierDismissible: true,
                                                barrierColor: Colors.black
                                                    .withOpacity(0.5),
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    insetPadding:
                                                        EdgeInsets.all(10),
                                                    child: NewDeleteButton(
                                                      changeActive: true,
                                                      documentId: document.id,
                                                      collectionName:
                                                          'listings',
                                                      refreshList: () {
                                                        setState(() {});
                                                      },
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      }));
                            })
                      ])),
                ))));
  }
}
