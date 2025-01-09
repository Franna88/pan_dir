import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'ServiceProfileComp/ImageScrollContainer.dart';
import 'ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocials.dart';
import 'ServiceProfileComp/ProfileTextContainer.dart';

class ServiceProfile extends StatefulWidget {
  final List<String> imagesData;
  final Map<String, String> linkData;
  final Map<String, String> contactData;
  final Function(int) updatePageIndex;
  const ServiceProfile(
      {super.key,
      required this.imagesData,
      required this.linkData,
      required this.contactData,
      required this.updatePageIndex});

  @override
  State<ServiceProfile> createState() => _ServiceProfileState();
}

class _ServiceProfileState extends State<ServiceProfile> {
  //final _firestore = FirebaseFirestore.instance;

  // @override
  // void initState() {
  //   _imagesData = _fetchImages();
  //   super.initState();
  // }

  // Future<List<Map<String, dynamic>>> _fetchImages() async {
  //   QuerySnapshot querySnapshot = await _firestore
  //       .collection('gallery')
  //       .where('listingsId',
  //           isEqualTo: int.parse(widget.listingData['listingsId']))
  //       .get();
  //   return querySnapshot.docs
  //       .map((doc) => doc.data() as Map<String, dynamic>)
  //       .toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MyUtility(context).width * 0.85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageScrollContainer(images: widget.imagesData),
              Column(
                children: [
                  ProfileSocials(
                      socialsLinks: widget.linkData,
                      updatePageIndex: widget.updatePageIndex),
                  ProfileTextContainer(
                    contactData: widget.contactData,
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.05,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
