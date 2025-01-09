import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';
/*
class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.5,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
      ),
      child: Center(
        child: Text(
          "Google Maps",
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'ralewaysemi',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  Maps({
    super.key,
  });

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController? mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MyUtility(context).height * 0.5,
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
        ),
        child: Center(
          child: GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(-33.9620090870212, 22.49702811430189),
              zoom: 15,
            ),
            markers: {
              Marker(
                  markerId: MarkerId("WEB Directories"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: LatLng(-33.9620090870212, 22.49702811430189)),
            },
          ),
        ));
  }
}
