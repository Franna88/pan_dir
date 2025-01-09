import 'package:flutter/material.dart';

import 'ServiceContactContainer1Comp/ServiceContact1.dart';

class ServiceContactContainer1 extends StatefulWidget {
  final String customerCare1;
  final String customerCare2;
  final String towingService;
  final String afterHours;
  final String email;
  final String fax;
  final String streetAddress;
  final String postalAddress;
  final String gpsCoordinates;

  const ServiceContactContainer1({
    Key? key,
    required this.customerCare1,
    required this.customerCare2,
    required this.towingService,
    required this.afterHours,
    required this.email,
    required this.fax,
    required this.streetAddress,
    required this.postalAddress,
    required this.gpsCoordinates,
  });

  @override
  State<ServiceContactContainer1> createState() =>
      _ServiceContactContainer1State();
}

class _ServiceContactContainer1State extends State<ServiceContactContainer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ServiceContact1(
            section1Texts: [
              'Customer Care 1',
              'Customer Care 2',
              'Towing Service',
              'After Hours',
              'Email',
              'Fax',
              'Street Address',
              'Postal Address',
              'GPS Coordinates',
            ],
            section2Texts: [
              widget.customerCare1,
              widget.customerCare2,
              widget.towingService,
              widget.afterHours,
              widget.email,
              widget.fax,
              widget.streetAddress,
              widget.postalAddress,
              widget.gpsCoordinates,
            ],
          )
        ],
      ),
    );
  }
}
