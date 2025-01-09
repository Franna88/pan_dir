import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../myutility.dart';
import '../../../components/descriptionDialog.dart';
import 'TextField/ProfileTextField.dart';
import 'buttons/AddButton.dart';
import 'package:http/http.dart' as http;

class EditMap extends StatefulWidget {
  final double lat;
  final double long;
  final String docId;
  EditMap(
      {super.key, required this.lat, required this.long, required this.docId});

  @override
  State<EditMap> createState() => _EditMapState();
}

class _EditMapState extends State<EditMap> {
  final searchResults = TextEditingController();
  String searchStatus = "";
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {};
  final _firestore = FirebaseFirestore.instance;
  double lat = 0;
  double long = 0;
  String coord = "";

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  saveNewMapLocation() async {
    await _firestore.collection('listings').doc(widget.docId).update({
      "longitude": long,
      "latitude": lat,
      "googlegps": coord,
    }).whenComplete(
        () => descriptionDialog("Details have been saved successfully!"));
  }

  void _onAddMarkerButtonPressed(LatLng latlang) {
    setState(() {
      if (_markers.length >= 1) {
        _markers.clear();
      }
      _markers.add(Marker(
        markerId: MarkerId("Home1"),
        position: latlang,
        infoWindow: InfoWindow(
          title: "",
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      lat = latlang.latitude;
      long = latlang.longitude;
      coord = latlang.toString();
    });
  }

  getGeoCoordFromAdd() {
    return http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?address=${searchResults.text}&region=es&key=AIzaSyBFFemx-2r0ZkP7T05pJo2nIjV_RB9R_VE'),
    );
  }

  getCoordFromAddress() async {
    final response = await getGeoCoordFromAdd();

    final decode =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    //Update marker

    if (decode['status'] == "OK") {
      setState(() {
        searchStatus = "";
        var lat = decode['results'][0]['geometry']['location']['lat'];
        var long = decode['results'][0]['geometry']['location']['lng'];
        var latLong = LatLng(lat, long);
        _onAddMarkerButtonPressed(latLong);
      });
    } else {
      setState(() {
        searchStatus = "Address not found";
      });
    }
  }

  @override
  void initState() {
    _markers.add(Marker(
      markerId: MarkerId("Home1"),
      position: LatLng(widget.lat, widget.long),
      infoWindow: InfoWindow(
        title: "",
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(color: Color(0xFF171616)),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Spacer(),
                              CloseButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Update Maps',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.6064,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Place mouse on the on the map and',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              'drag ',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 108, 9),
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              'to new location or type address in text field and select from google predictor.Select ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              '"Save Map"',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 108, 9),
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              'button to update and exit.  If unhappy, select ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              '"Reset Marker"',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 108, 9),
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                            Text(
                              'button and repeat the process ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        AddButton(
                          text: 'Save Map',
                          onPressed: () {
                            saveNewMapLocation();
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                ProfileTextField(
                                    controller: searchResults,
                                    headline: 'Address:'),
                                Visibility(
                                    visible: searchStatus != "",
                                    child: Text(
                                      searchStatus,
                                      style: TextStyle(
                                          color: Color(0xFFFF8728),
                                          fontSize: 15),
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            AddButton(
                              text: 'Search',
                              onPressed: () {
                                getCoordFromAddress();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: MyUtility(context).width * 0.75,
                          height: MyUtility(context).height * 0.50,
                          child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(widget.lat, widget.long),
                                zoom: 5,
                              ),
                              onTap: (latlang) {
                                _onAddMarkerButtonPressed(latlang);
                              },
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              markers: _markers),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
