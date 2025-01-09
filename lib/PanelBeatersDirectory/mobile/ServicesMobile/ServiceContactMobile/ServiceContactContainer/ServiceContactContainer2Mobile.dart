import 'package:flutter/material.dart';

import 'ServiceContactContainer2comp/ServiceContainer2topMobile.dart';

class ServiceContactContainer2Mobile extends StatefulWidget {
  final List<Map<String, dynamic>> contactPersons;
  const ServiceContactContainer2Mobile({Key? key, required this.contactPersons})
      : super(key: key);

  @override
  State<ServiceContactContainer2Mobile> createState() =>
      _ServiceContactContainer2MobileState();
}

class _ServiceContactContainer2MobileState
    extends State<ServiceContactContainer2Mobile> {
  final ScrollController _scrollController = ScrollController();
  List<String> section1Texts = ['Contact'];
  List<String> section2Texts = ['Designation'];
  List<String> section3Texts = ['Tel'];
  List<String> section4Texts = ['Email'];

  @override
  void initState() {
    _formatContactData();
    super.initState();
  }

  void _formatContactData() {
    if (widget.contactPersons.isNotEmpty) {
      List<String> section1 = section1Texts; // Full name
      List<String> section2 = section2Texts; // Designation
      List<String> section3 = section3Texts; // Cell
      List<String> section4 = section4Texts; // Email

      for (int i = 0; i < widget.contactPersons.length; i++) {
        section1.add(widget.contactPersons[i]['contactPerson']);
        section2.add(widget.contactPersons[i]['contactPersonDesignation']);
        section3.add(widget.contactPersons[i]['contactPersonCell']);
        section4.add(widget.contactPersons[i]['contactPersonEmail']);
      }

      setState(() {
        section1Texts = section1;
        section2Texts = section2;
        section3Texts = section3;
        section4Texts = section4;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF1D2023),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ServiceContainer2topMobile(
            section1Texts: section1Texts,
            section2Texts: section2Texts,
            section3Texts: section3Texts,
            section4Texts: section4Texts,
          ),
        ],
      ),
    );
  }
}
