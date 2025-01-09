import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/commonButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/BusinessHours/BusinessHoursMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/MapsContainercomp/MapsContainerMobile.dart';
import 'package:webdirectories/myutility.dart';

class ServicesMapsMobile extends StatefulWidget {
  final int listingId;
  final String listingAddress;
  final double listinglatitude;
  final double listinglongitude;
  const ServicesMapsMobile(
      {super.key,
      required this.listingId,
      required this.listingAddress,
      required this.listinglatitude,
      required this.listinglongitude});

  @override
  State<ServicesMapsMobile> createState() => _ServicesMapsMobileState();
}

class _ServicesMapsMobileState extends State<ServicesMapsMobile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          MapsContainerMobile(
              address: widget.listingAddress,
              latitude: widget.listinglatitude,
              longitude: widget.listinglongitude),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: SizedBox(
              width: MyUtility(context).width * 0.85,
              child: Text(
                'City | Suburb | Province',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.24,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          BusinessHoursMobile(
            listingId: widget.listingId,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonButton(buttonText: 'Navigate Me Now', onPress: () {}),
              ],
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
          )
        ],
      ),
    );
  }
}
