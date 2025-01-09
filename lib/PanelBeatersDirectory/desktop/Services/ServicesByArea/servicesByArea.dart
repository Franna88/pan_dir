import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/extensions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/services.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/routes/routerNames.dart';

import '../../../../routes/routerNames.dart';

class ServicesByArea extends StatefulWidget {
  const ServicesByArea({super.key});

  @override
  State<ServicesByArea> createState() => _ServicesByAreaState();
}

class _ServicesByAreaState extends State<ServicesByArea> {
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

  Position? _userPosition;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _fetchAllFilters();
  }

  _calculateDistance(userLat, userLong, listingLat, listingLong) {
    // Calculate the distance
    double distance =
        Geolocator.distanceBetween(userLat, userLong, listingLat, listingLong);

    return (distance / 1000).toStringAsFixed(1);
  }

  Future<List<Map<String, dynamic>>> _getListings() async {
    // Fetch featured listings
    QuerySnapshot querySnapshot = await _firestore
        .collection('listings')
        //.where('featured', isEqualTo: 1)
        .limit(40)
        .get();

    List<Future<Map<String, dynamic>>> listingFutures =
        querySnapshot.docs.map((doc) async {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      // String? imageUrl =
      //     await getImageUrl('listings/images/listings/${data['displayphoto']}');
      // if (imageUrl != null) {
      //   data['displayphoto'] = imageUrl;
      // }

      data['distance'] = _userPosition?.latitude != null
          ? '${_calculateDistance(_userPosition?.latitude, _userPosition?.longitude, data['latitude'], data['longitude'])}'
          : /**/
          '0 km';
      return data;
    }).toList();

    // Wait for all futures to complete
    List<Map<String, dynamic>> listings = await Future.wait(listingFutures);

    // Filter out listings with null displayphoto
    listings = listings
        .where((listing) => (listing['displayphoto'] as String)
            .contains('https://firebasestorage.googleapis.com'))
        .toList();

    //  listings.sort((a, b) => a['distance'].compareTo(b['distance']));

    return listings;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mainbackgroundPanel.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: MyUtility(context).height * 0.025),
                  SizedBox(
                    width: MyUtility(context).width / 1.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'images/panelLogo.png',
                          width: MyUtility(context).width * 0.21,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         context.goNamed(Routernames.panelbeatersHome);
                        //       },
                        //       child: Row(
                        //         children: [
                        //           Container(
                        //             padding: const EdgeInsets.all(1),
                        //             decoration: BoxDecoration(
                        //               shape: BoxShape.circle,
                        //               border: Border.all(
                        //                 color: Colors.white,
                        //                 width: 0.5,
                        //               ),
                        //             ),
                        //             child: const Center(
                        //               child: Icon(
                        //                 Icons.keyboard_arrow_left,
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             width: 8,
                        //           ),
                        //           const Text(
                        //             'Go Back',
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 17.68,
                        //               fontFamily: 'raleway',
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //      SizedBox(
                        //       width: MyUtility(context).width * 0.04,
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width / 1.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ServicesStackedButton(
                          toggleFeatured: toggleFeatured,
                          isFeaturedSelected: isFeatured,
                        ),
                        Row(
                          children: [
                            IconButtons(
                              isComingSoon: true,
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.03,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  _isLoading
                      ? SizedBox.shrink()
                      : Row(
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
                          cityId: _selectedCity,
                          suburbId: _selectedSuburb),
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
                                style: const TextStyle(color: Colors.white)),
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
                        List<Map<String, dynamic>> listings = snapshot.data!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 20.0),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5, // Number of items per row
                              mainAxisSpacing: 8.0,
                              crossAxisSpacing: 8.0,
                              childAspectRatio:
                                  3 / 3.5, // Adjust the aspect ratio as needed
                            ),
                            itemCount: listings.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> listing = listings[index];

                              return Visibility(
                                visible: getSearchValue(listing),
                                child: ServiceFeaturedContainer(
                                  businessImage: listing['displayphoto'],
                                  businessName: listing['title'],
                                  businessAddress: listing['postaladdress'],
                                  OnPressed: () {
                                    storage.write(
                                        key: 'id',
                                        value:
                                            listing['listingsId'].toString());
                                    storage.write(
                                        key: 'title',
                                        value: listing['title'].toString());
                                    context.goNamed(
                                      Routernames.panelbeatersServicesProfile,
                                      pathParameters: {
                                        'id': listing['listingsId'].toString()
                                      },
                                    );
                                  },
                                  navigateMe: () async {
                                    final Uri uri = Uri.parse(
                                        "https://www.google.com/maps/search/${listing['streetaddress']}");
                                    await launchUrl(uri);
                                  },
                                  views: '${listing['views']}',
                                  distance: null,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            PanelFooter()
          ],
        ),
      ),
    );
  }
}
