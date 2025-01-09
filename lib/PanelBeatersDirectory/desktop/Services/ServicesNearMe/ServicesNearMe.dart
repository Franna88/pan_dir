import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Locations/LocationFeaturedComponents/BuisnessImageContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServiceStackedButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesComponent/ServicesContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/iconButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webdirectories/routes/routerNames.dart';
import 'ServicesNearMeOther.dart';
import '../services.dart';
import 'dart:math';

class ServicesNearMe extends StatefulWidget {
  ServicesNearMe({
    Key? key,
  }) : super(key: key);

  @override
  _ServicesNearMeState createState() => _ServicesNearMeState();
}

class _ServicesNearMeState extends State<ServicesNearMe> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController search = TextEditingController();
  bool showOtherServices = false;
  Position? _userPosition;
  bool isFeatured = true;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    // Check if location services are enabled
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);

    setState(() {
      _userPosition = position;
    });
  }

  /// Calculates the bounding box for a given radius (in km) around a point.
  Map<String, double> _calculateBoundingBox(
      double userLat, double userLng, double radiusInKm) {
    const double earthRadius = 6371.0; // Earth's radius in kilometers

    // Latitude offset
    double latOffset = radiusInKm / earthRadius;
    double latMin = userLat - latOffset * (180 / pi);
    double latMax = userLat + latOffset * (180 / pi);

    // Longitude offset, which depends on the latitude
    double lngOffset = radiusInKm / (earthRadius * cos(userLat * pi / 180));
    double lngMin = userLng - lngOffset * (180 / pi);
    double lngMax = userLng + lngOffset * (180 / pi);

    return {
      "latMin": latMin,
      "latMax": latMax,
      "lngMin": lngMin,
      "lngMax": lngMax,
    };
  }

  /// Fetches documents within a 100 km radius from the user's location.
  Future<List<Map<String, dynamic>>> fetchNearbyLocations(
      double userLat, double userLng, double radiusInKm) async {
    // Calculate bounding box
    Map<String, double> bounds =
        _calculateBoundingBox(userLat, userLng, radiusInKm);

    // Step 1: Query Firestore by latitude range only
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('listings')
        .where('featured', isEqualTo: isFeatured == true ? 1 : 0)
        .where('latitude', isGreaterThanOrEqualTo: bounds['latMin'])
        .where('latitude', isLessThanOrEqualTo: bounds['latMax'])
        .get();

    // Step 2: Filter results by longitude range and exact distance
    List<Map<String, dynamic>> nearbyLocations = [];
    for (var doc in querySnapshot.docs) {
      double lat = doc['latitude'];
      double lng = doc['longitude'];

      // Check if the longitude is within bounds
      if (lng >= bounds['lngMin']! && lng <= bounds['lngMax']!) {
        // Calculate the exact distance to make sure it's within the radius
        double distance = _calculateDistance(userLat, userLng, lat, lng);
        if (distance <= radiusInKm) {
          nearbyLocations.add(
              {...doc.data() as Map<String, dynamic>, 'distance': distance});
        }
      }
    }

    List<Future<Map<String, dynamic>>> listingFutures =
        nearbyLocations.map((doc) async {
      Map<String, dynamic> data = doc;
      // String? imageUrl =
      //     await getImageUrl('listings/images/listings/${data['displayphoto']}');

      // data['displayphoto'] = imageUrl;

      int viewCount = await _firestore
          .collection('views')
          .doc(doc['listingsId'].toString())
          .get()
          .then((snapshot) => snapshot['views'].length)
          .catchError((error) => 0);

      doc['views'] = viewCount;

      return data;
    }).toList();

    // Wait for all futures to complete
    List<Map<String, dynamic>> listings = await Future.wait(listingFutures);

    // Filter out listings with null displayphoto
    listings = listings
        .where((listing) => (listing['displayphoto'] as String)
            .contains('https://firebasestorage.googleapis.com'))
        .toList();

    listings =
        listings.where((listing) => listing['distance'] != null).toList();

    // Sort the list by distance
    listings.sort((a, b) => a['distance'].compareTo(b['distance']));

    // Return sorted documents only
    return listings
        .map((doc) => {
              ...doc,
              'distance': '${(doc['distance'] as double).toStringAsFixed(1)} km'
            })
        .toList();
  }

  _calculateDistance(userLat, userLong, listingLat, listingLong) {
    // Calculate the distance
    double distance =
        Geolocator.distanceBetween(userLat, userLong, listingLat, listingLong);

    return (distance / 1000);
  }

  void toggleFeatured() {
    setState(() {
      isFeatured = !isFeatured;
    });
  }

  void toggleToOther() {
    setState(() {
      showOtherServices = true;
    });
  }

  //filter data on search value
  bool getSearchValue(document) {
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
              height: MyUtility(context).height,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_left,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Go Back',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.68,
                                      fontFamily: 'raleway',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                             SizedBox(
                              width: MyUtility(context).width * 0.04,
                            )
                          ],
                        ),
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
                            IconButtons(),
                            SizedBox(
                              width: MyUtility(context).width * 0.03,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MyUtility(context).width / 1.1,
                        height: 34.68,
                        padding: const EdgeInsets.only(
                          top: 10.80,
                          left: 10.80,
                          right: 21.59,
                          bottom: 10.80,
                        ),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.83),
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
                      SizedBox(
                        width: MyUtility(context).width * 0.01,
                      )
                    ],
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.85 - 48,
                    child: FutureBuilder<List<Map<String, dynamic>>>(
                      future: fetchNearbyLocations(_userPosition!.latitude,
                          _userPosition!.longitude, 100.0),
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
                              'No listings found near you',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                        List<Map<String, dynamic>> listings =
                            snapshot.data!.map((doc) => doc).toList();
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

                              // print(listing);
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
                                        });
                                  },
                                  navigateMe: () async {
                                    final Uri uri = Uri.parse(
                                        "https://www.google.com/maps/search/${listing['streetaddress']}");
                                    await launchUrl(uri);
                                  },
                                  views: '${listing['views']}',
                                  distance: (listing['distance']).toString(),
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
