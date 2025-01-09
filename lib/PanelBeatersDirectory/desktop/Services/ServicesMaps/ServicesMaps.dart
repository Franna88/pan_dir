import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/BusinessHours/BusinessHours.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/MapsContainercomp/MapButtons.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/MapsContainercomp/MapsContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/commonButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class ServicesMaps extends StatefulWidget {
  final int listingId;
  final String listingAddress;
  final double listinglatitude;
  final double listinglongitude;
  const ServicesMaps(
      {super.key,
      required this.listingId,
      required this.listingAddress,
      required this.listinglatitude,
      required this.listinglongitude});

  @override
  State<ServicesMaps> createState() => _ServicesMapsState();
}

class _ServicesMapsState extends State<ServicesMaps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MapsContainer(
                address: widget.listingAddress,
                latitude: widget.listinglatitude,
                longitude: widget.listinglongitude),
            BusinessHours(
              listingId: widget.listingId,
            )
          ],
        ),
        SizedBox(
          width: MyUtility(context).width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(alignment: Alignment.topLeft, child: MapButtons()),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: CommonButtonR(
                  buttonText: 'Navigate Me Now',
                  onPress: () {},
                  isComingSoon: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
