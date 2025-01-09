import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webdirectories/myutility.dart';

class MapsContainer extends StatefulWidget {
  final String address;
  final double latitude;
  final double longitude;
  const MapsContainer(
      {super.key,
      required this.address,
      required this.latitude,
      required this.longitude});

  @override
  State<MapsContainer> createState() => _MapsContainerState();
}

class _MapsContainerState extends State<MapsContainer> {
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
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.625,
      decoration: ShapeDecoration(
        color: Color(0xFFFF8728),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 20,
                    height: 20,
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
            width: MyUtility(context).width * 0.41,
            height: MyUtility(context).height * 0.57,
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
    );
  }
}
