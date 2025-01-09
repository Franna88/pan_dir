import 'package:flutter/material.dart';

import 'ServiceContactContainer1Comp/ServiceContact1.dart';

class ServiceContactContainer1Mobile extends StatefulWidget {
  final String customerCare1;
  final String customerCare2;
  final String towingService;
  final String afterHours;
  final String email;
  final String fax;
  final String streetAddress;
  final String postalAddress;
  final String gpsCoordinates;

  const ServiceContactContainer1Mobile({
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
  State<ServiceContactContainer1Mobile> createState() =>
      _ServiceContactContainer1MobileState();
}

class _ServiceContactContainer1MobileState
    extends State<ServiceContactContainer1Mobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          /*ContainerRoundedCornerTop(
            contactList: 'Customer Care 1',
            contactDetails: widget.customerCare1,
          ),
          ContactContainer1Grey(
            contactList: 'Customer Care 2',
            contactDetails: widget.customerCare2,
          ),
          ContactContainer1Sections(
            contactList: 'Towing Service',
            contactDetails: widget.towingService,
          ),
          ContactContainer1Grey(
            contactList: 'After Hours',
            contactDetails: widget.afterHours,
          ),
          ContactContainer1Sections(
            contactList: 'Email',
            contactDetails: widget.email,
          ),
          ContactContainer1Grey(
            contactList: 'Fax',
            contactDetails: widget.fax,
          ),
          ContactContainer1Sections(
            contactList: 'Street Address',
            contactDetails: widget.streetAddress,
          ),
          ContactContainer1Grey(
            contactList: 'Postal Address',
            contactDetails: widget.postalAddress,
          ),
          RoundedCornerBottom(
            contactList: 'GPS Coordinates',
            contactDetails: widget.gpsCoordinates,
          ),*/
          ServiceContactMobile1(
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
