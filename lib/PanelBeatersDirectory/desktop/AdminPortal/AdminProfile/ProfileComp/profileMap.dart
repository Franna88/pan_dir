import 'dart:async';
import 'dart:typed_data';
import 'package:cached_firestorage/lib.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/editMap.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';

class profileMap extends StatefulWidget {
  final double lat;
  final double long;
  final String docId;
  const profileMap(
      {super.key, required this.lat, required this.long, required this.docId});

  @override
  State<profileMap> createState() => _profileMapState();
}

class _profileMapState extends State<profileMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  //Dialog for notification popup
  Future editMapPopup() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: EditMap(
          lat: widget.lat,
          long: widget.long,
          docId: widget.docId,
        ));
      });

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () {
                editMapPopup();
              },
              child: Text(
                "Change Map",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.7364,
                  fontFamily: 'raleway',
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: widthDevice < 1500
                ? MyUtility(context).width * 0.3
                : MyUtility(context).width * 0.22,
            height: MyUtility(context).height * 0.27,
            child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.lat, widget.long),
                  zoom: 5,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: {
                  Marker(
                    markerId: MarkerId("Home1"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(widget.lat, widget.long),
                  ),
                }),
          ),
          /* floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),*/
        ],
      ),
    );
  }
}
