import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/LocationMobileContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/LocationsMobile/LocationFeaturedComponents/stackedMobilebutton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/MobileTopNavBar/MobileTopNavBarhome.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMobile.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/routes/routerNames.dart';

class MobileServicesByArea extends StatefulWidget {
  const MobileServicesByArea({super.key});

  @override
  State<MobileServicesByArea> createState() => _MobileServicesByAreaState();
}

class _MobileServicesByAreaState extends State<MobileServicesByArea> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController search = TextEditingController();
  bool showOtherServices = false;
  bool isFeatured = true;

  List<Map<String, dynamic>> countriesList = [
    {'countryId': '', 'country': 'All'}
  ];
  List<Map<String, dynamic>> provincesList = [
    {'provinceId': '', 'province': 'All'}
  ];
  List<Map<String, dynamic>> citiesList = [
    {'cityId': '', 'city': 'All'}
  ];
  List<Map<String, dynamic>> suburbsList = [
    {'suburbId': '', 'suburb': 'All'}
  ];
  List<Map<String, dynamic>> allCountries = [];
  List<Map<String, dynamic>> allProvinces = [];
  List<Map<String, dynamic>> allCities = [];
  List<Map<String, dynamic>> allSuburbs = [];

  String? _selectedCountry = '';
  String? _selectedProvince = '';
  String? _selectedCity = '';
  String? _selectedSuburb = '';

  bool _isLoading = true;

  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _fetchAllFilters();
  }

  Future<void> _fetchAllFilters() async {
    await Future.wait([
      _getCountries(),
      _getProvinces(),
      _getCities(),
      _getSuburbs(),
    ]);
    setState(() {
      countriesList = [
        {'countryId': '', 'country': 'All'}
      ]..addAll(allCountries);
      provincesList = [
        {'provinceId': '', 'province': 'All'}
      ]..addAll(allProvinces);
      citiesList = [
        {'cityId': '', 'city': 'All'}
      ]..addAll(allCities);
      suburbsList = [
        {'suburbId': '', 'suburb': 'All'}
      ]..addAll(allSuburbs);
      _isLoading = false;
    });
  }

  Future<void> _getCountries() async {
    QuerySnapshot querySnapshot = await _firestore.collection('country').get();
    allCountries = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
    allCountries.sort((a, b) => a['orderCountry'].compareTo(b['orderCountry']));
  }

  Future<void> _getProvinces() async {
    QuerySnapshot querySnapshot = await _firestore.collection('province').get();
    allProvinces = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<void> _getCities() async {
    QuerySnapshot querySnapshot = await _firestore.collection('city').get();
    allCities = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<void> _getSuburbs() async {
    QuerySnapshot querySnapshot = await _firestore.collection('suburb').get();
    allSuburbs = querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  void _filterProvinces(String? countryId) {
    setState(() {
      _selectedProvince = '';
      _selectedCity = '';
      _selectedSuburb = '';
      provincesList = [
        {'provinceId': '', 'province': 'All'}
      ];

      if (countryId != null && countryId.isNotEmpty) {
        provincesList.addAll(
            allProvinces.where((p) => p['countryId'] == int.parse(countryId)));
      }
    });
  }

  void _filterCities(String? provinceId) {
    setState(() {
      _selectedCity = '';
      _selectedSuburb = '';
      citiesList = [
        {'cityId': '', 'city': 'All'}
      ];
      if (provinceId != null && provinceId.isNotEmpty) {
        citiesList.addAll(
            allCities.where((c) => c['provinceId'] == int.parse(provinceId)));
      }
    });
  }

  void _filterSuburbs(String? cityId) {
    setState(() {
      _selectedSuburb = '';
      suburbsList = [
        {'suburbId': '', 'suburb': 'All'}
      ];
      if (cityId != null && cityId.isNotEmpty) {
        suburbsList
            .addAll(allSuburbs.where((s) => s['cityId'] == int.parse(cityId)));
      }
    });
  }

  Future<List<Map<String, dynamic>>> _fetchFilteredDocuments({
    String? countryId,
    String? provinceId,
    String? suburbId,
    String? cityId,
  }) async {
    print(countryId);
    print(provinceId);
    print(suburbId);
    print(cityId);

    // Start the query with a reference to the collection
    Query<Map<String, dynamic>> query = FirebaseFirestore.instance
        .collection('listings')
        .where('featured', isEqualTo: isFeatured ? 1 : 0);

    // Apply filters based on non-null and non-empty values
    if (countryId != null && countryId.isNotEmpty) {
      query = query.where('countryId', isEqualTo: int.parse(countryId));
    }
    if (provinceId != null && provinceId.isNotEmpty) {
      query = query.where('provinceId', isEqualTo: int.parse(provinceId));
    }
    if (suburbId != null && suburbId.isNotEmpty) {
      query = query.where('suburbId', isEqualTo: int.parse(suburbId));
    }
    if (cityId != null && cityId.isNotEmpty) {
      query = query.where('cityId', isEqualTo: int.parse(cityId));
    }

    try {
      // Fetch the documents with a one-time call
      final querySnapshot = await query.get();
      print(querySnapshot.docs.length);

      List<Map<String, dynamic>> filteredDocuments = querySnapshot.docs
          .take(40)
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      // Convert the documents to a List of Map<String, dynamic>
      List<Future<Map<String, dynamic>>> listingFutures =
          filteredDocuments.map((doc) async {
        // String? imageUrl = await getImageUrl(
        //     'listings/images/listings/${doc['displayphoto']}');
        // doc['displayphoto'] = imageUrl;

        int viewCount = await _firestore
            .collection('views')
            .doc(doc['listingsId'].toString())
            .get()
            .then((snapshot) => snapshot['views'].length)
            .catchError((error) => 0);

        doc['views'] = viewCount;
        return doc;
      }).toList();

      // Wait for all futures to complete
      List<Map<String, dynamic>> listings = await Future.wait(listingFutures);

      // Filter out listings with null displayphoto
      listings = listings
          .where((listing) => (listing['displayphoto'] as String)
              .contains('https://firebasestorage.googleapis.com'))
          .toList();

      return listings;
    } catch (e) {
      print("Error fetching filtered documents: $e");
      return []; // Return an empty list in case of an error
    }
  }

  void toggleFeatured() {
    setState(() {
      isFeatured = !isFeatured;
    });
  }

  // void toggleToOther() {
  //   setState(() {
  //     showOtherServices = true;
  //   });
  // }

//filter data on search value
  getSearchValue(document) {
    var title = document['title'].split(' ');

    if ((search.text) == "") {
      return true;
    } else if ((search.text).contains(title[0])) {
      return true;
    } else if (title[1] != null && (search.text).contains(title[1])) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyUtility(context).height,
        width: MyUtility(context).width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/mainBackgroundpan.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MobileTopNavBarhome(),
              SizedBox(height: MyUtility(context).height * 0.025),
              SizedBox(
                width: MyUtility(context).width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StackedMobileButtons(
                      isFeaturedSelected: isFeatured,
                      toggleFeatured: toggleFeatured,
                    ),
                  ],
                ),
              ),
              Container(
                width: MyUtility(context).width * 0.9,
                height: MyUtility(context).height * 0.05,
                padding: const EdgeInsets.only(
                  top: 10.80,
                  left: 10.80,
                  right: 21.59,
                  bottom: 10.80,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'Search Featured',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.6812,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                      top: 10.80,
                      left: 10.80,
                      right: 21.59,
                      bottom: 10.80,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24.83),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.6812,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: MyUtility(context).height * 0.025),
              _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileDropDown(
                              width: 280.0,
                              height: 50.0,
                              headline: 'Select a Country',
                              items: countriesList
                                  .map((country) => {
                                        'value':
                                            country['countryId'].toString(),
                                        'label': country['country']
                                      })
                                  .toList(),
                              value: _selectedCountry,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCountry = newValue;
                                });
                                _filterProvinces(newValue);
                              },
                            ),
                            ProfileDropDown(
                              width: 280.0,
                              height: 50.0,
                              headline: 'Select a Province',
                              items: provincesList
                                  .map((province) => {
                                        'value':
                                            province['provinceId'].toString(),
                                        'label': province['province']
                                      })
                                  .toList(),
                              value: _selectedProvince,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedProvince = newValue;
                                });
                                _filterCities(newValue);
                              },
                            ),
                            ProfileDropDown(
                              width: 280.0,
                              height: 50.0,
                              headline: 'Select a City',
                              items: citiesList
                                  .map((city) => {
                                        'value': city['cityId'].toString(),
                                        'label': city['city']
                                      })
                                  .toList(),
                              value: _selectedCity,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedCity = newValue;
                                });
                                _filterSuburbs(newValue);
                              },
                            ),
                            ProfileDropDown(
                              width: 280.0,
                              height: 50.0,
                              headline: 'Select a Suburb',
                              items: suburbsList
                                  .map((suburb) => {
                                        'value': suburb['suburbId'].toString(),
                                        'label': suburb['suburb']
                                      })
                                  .toList(),
                              value: _selectedSuburb,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedSuburb = newValue;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MyUtility(context).height * 0.85,
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                            future: _fetchFilteredDocuments(
                              countryId: _selectedCountry,
                              provinceId: _selectedProvince,
                              suburbId: _selectedSuburb,
                              cityId: _selectedCity,
                            ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                ));
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}',
                                      style:
                                          const TextStyle(color: Colors.white)),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'No listings found',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }
                              List<Map<String, dynamic>> listings =
                                  snapshot.data!;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        1, // Number of items per row
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    childAspectRatio:
                                        1, // Adjust the aspect ratio as needed
                                  ),
                                  itemCount: listings.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> listing =
                                        listings[index];

                                    /**/
                                    print(listing);
                                    return Visibility(
                                      visible: getSearchValue(listing),
                                      child: LocationMobileContainer(
                                        businessImage: listing['displayphoto'],
                                        businessName: listing['title'],
                                        businessAddress:
                                            listing['postaladdress'],
                                        OnPressed: () {
                                          context.goNamed(
                                            Routernames
                                                .panelbeatersServicesProfile,
                                            pathParameters: {
                                              'id': listing['listingsId']
                                                  .toString()
                                            },
                                          );
                                        },
                                        views: (listing['views'] as int)
                                            .toString(),
                                        distance: '',
                                        navigateMe: () async {
                                          final Uri uri = Uri.parse(
                                              "https://www.google.com/maps/search/${listing['streetaddress']}");
                                          await launchUrl(uri);
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
