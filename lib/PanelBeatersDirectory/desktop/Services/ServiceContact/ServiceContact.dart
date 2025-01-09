import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

import 'ServiceContactContainer/ServiceContactContainer2.dart';
import 'ServiceContactContainer/ServiceContactcontainer1.dart';

class ServiceContact extends StatefulWidget {
  final Map<String, dynamic> listingData;
  const ServiceContact({super.key, required this.listingData});

  @override
  State<ServiceContact> createState() => _ServiceContactState();
}

class _ServiceContactState extends State<ServiceContact> {
  final _firestore = FirebaseFirestore.instance;
  late List<Map<String, dynamic>> _contactPersonData = [];
  bool _isLoading = true;
  @override
  void initState() {
    _getContactPersonData();
    super.initState();
  }

  Future<void> _getContactPersonData() async {
    try {
      QuerySnapshot contactPersonSnapshot = await _firestore
          .collection('contact_person')
          .where('listingsId', isEqualTo: widget.listingData['listingsId'])
          .get();

      if (contactPersonSnapshot.docs.isNotEmpty) {
        setState(() {
          _contactPersonData = contactPersonSnapshot.docs
              .map((contact) => contact.data() as Map<String, dynamic>)
              .toList();
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching contact person data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ServiceContactContainer1(
          customerCare1: widget.listingData['customerCare1'] != null
              ? widget.listingData['customerCare1']
              : '-',
          customerCare2: widget.listingData['customerCare2'] != null
              ? widget.listingData['customerCare2']
              : '-',
          towingService: widget.listingData['towing'] != null
              ? widget.listingData['towing']
              : '-',
          afterHours: widget.listingData['businessAfterhours'],
          email: widget.listingData['businessEmail'],
          fax: widget.listingData['businessFaxnumber'],
          streetAddress: widget.listingData['streetaddress'],
          postalAddress: widget.listingData['postaladdress'],
          gpsCoordinates: widget.listingData['gpsCoordinates'],
        ),
        SizedBox(
          height: 20,
        ),
        _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : _contactPersonData.isNotEmpty
                ? ServiceContactContainer2(contactPersons: _contactPersonData)
                : const Center(
                    child: Text(
                      'Not contact persons available',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        )
      ],
    );
  }
}
