import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webdirectories/myutility.dart';

class MapsContainerMobile extends StatefulWidget {
  final String address;
  final double latitude;
  final double longitude;
  const MapsContainerMobile(
      {super.key,
      required this.address,
      required this.latitude,
      required this.longitude});

  @override
  State<MapsContainerMobile> createState() => _MapsContainerMobileState();
}

class _MapsContainerMobileState extends State<MapsContainerMobile> {
  late GoogleMapController mapController;
  late Marker _marker;

  @override
  void initState() {
    super.initState();
    _marker = Marker(
      markerId: const MarkerId('locationMarker'),
      position: LatLng(widget.latitude, widget.longitude),
      infoWindow: const InfoWindow(title: 'Marker', snippet: 'Your Location'),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.9,
        height: MyUtility(context).height * 0.4,
        decoration: ShapeDecoration(
          color: Color(0xFFFF8728),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 22,
                      height: 22,
                      child: SvgPicture.asset('images/pindropblack.svg')),
                  Text(
                    widget.address,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.88,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MyUtility(context).width * 0.85,
              height: MyUtility(context).height * 0.35,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(widget.latitude, widget.longitude),
                  zoom: 14.0,
                ),
                markers: {_marker},
              ),
            )
          ],
        ),
      ),
    );
  }
}
