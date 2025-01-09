import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class SetYourLoactionButton extends StatefulWidget {
  const SetYourLoactionButton({super.key});

  @override
  State<SetYourLoactionButton> createState() => _SetYourLoactionButtonState();
}

class _SetYourLoactionButtonState extends State<SetYourLoactionButton> {
  String nearMeText = 'Click here to set your location';
  bool isLocationSet = false;

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
        isLocationSet = true;
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
        isLocationSet = false;
      });

      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          nearMeText = 'Location permissions are denied';
          isLocationSet = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        nearMeText = 'Location permissions are permanently denied';
        isLocationSet = false;
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
          backgroundColor: isLocationSet
              ? Colors.black
              : const Color.fromARGB(255, 196, 195, 195),
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
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isLocationSet ? Colors.green : Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.check,
                  color: isLocationSet
                      ? Colors.white // Change to green when location is set
                      : Colors.black,
                  size: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  nearMeText,
                  style: TextStyle(
                    color: isLocationSet
                        ? Colors.white // Change to green when location is set
                        : Colors.black,
                    fontSize: 16.5,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
