import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/myutility.dart';

import 'ServiceContactContainer2comp/ServiceContactContainer2top.dart';

class ServiceContactContainer2 extends StatefulWidget {
  final List<Map<String, dynamic>> contactPersons;
  const ServiceContactContainer2({
    Key? key,
    required this.contactPersons,
  }) : super(key: key);

  @override
  State<ServiceContactContainer2> createState() =>
      _ServiceContactContainer2State();
}

class _ServiceContactContainer2State extends State<ServiceContactContainer2> {
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
      height: MyUtility(context).height * 0.2,
      width: MyUtility(context).width * 0.85,
      decoration: BoxDecoration(
        color: const Color(0xFF1D2023),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Colors.grey,
          alwaysVisibleScrollThumb: true,
          padding: EdgeInsets.only(right: 8.0),
          child: ListView(
            controller: _scrollController,
            children: [
              ServiceContainer2top(
                section1Texts: section1Texts,
                section2Texts: section2Texts,
                section3Texts: section3Texts,
                section4Texts: section4Texts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
