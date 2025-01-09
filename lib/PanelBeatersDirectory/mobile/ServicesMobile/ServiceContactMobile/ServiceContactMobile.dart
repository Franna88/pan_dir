import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ServiceContactContainer/ServiceContactContainer1Mobile.dart';
import 'ServiceContactContainer/ServiceContactContainer2Mobile.dart';

class ServiceContactMobile extends StatefulWidget {
  final Map<String, dynamic> listingData;
  const ServiceContactMobile({super.key, required this.listingData});

  @override
  State<ServiceContactMobile> createState() => _ServiceContactMobileState();
}

class _ServiceContactMobileState extends State<ServiceContactMobile> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: ServiceContactContainer1Mobile(
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
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Text(
            'The Team:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.4,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : _contactPersonData.isNotEmpty
                    ? ServiceContactContainer2Mobile(
                        contactPersons: _contactPersonData)
                    : const Center(
                        child: Text(
                          'Not contact persons available',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
          ),
        )
      ],
    );
  }
}
