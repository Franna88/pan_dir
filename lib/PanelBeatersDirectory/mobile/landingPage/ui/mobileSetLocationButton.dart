import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MobileSetLocationButton extends StatefulWidget {
  const MobileSetLocationButton({super.key});

  @override
  State<MobileSetLocationButton> createState() =>
      _MobileSetLocationButtonState();
}

class _MobileSetLocationButtonState extends State<MobileSetLocationButton> {
  String nearMeText = 'Find your nearest Panel Beater';

  @override
  void initState() {
    super.initState();
    _checkPermissionOnInit();
  }

  void _checkPermissionOnInit() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission != LocationPermission.denied) {
      setState(() {
        nearMeText = 'Location set! Click search';
      });
    }
  }

  void _checkPermissionAndGetLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      setState(() {
        nearMeText = 'Location services are disabled.';
      });

      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          nearMeText = 'Location permissions are denied';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        nearMeText = 'Location permissions are permanently denied';
      });
      return;
    }

    // permissions granted
    setState(() {
      nearMeText = 'Location set! Click search';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      /*width: MediaQuery.of(context).size.width * 0.08,*/
      /*height: MediaQuery.of(context).size.height * 0.05,*/
      child: ElevatedButton(
        onPressed: _checkPermissionAndGetLocation,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 196, 195, 195),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 6, bottom: 6, left: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.check,
                  color: Colors.black,
                  size: 14,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                nearMeText,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
