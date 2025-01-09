import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/ProfileImage.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/LongTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/TextField/ProfileShortTextField.dart';
import 'package:webdirectories/myutility.dart';

import '../ProfileComp/profileMap.dart';

class BusinessAddress extends StatefulWidget {
  final String imageName;
  final TextEditingController countryController;
  final TextEditingController provinceController;
  final TextEditingController cityController;
  final TextEditingController suburbController;
  final TextEditingController streetController;
  final TextEditingController postalController;
  final VoidCallback imageChange;
  final double lat;
  final double long;
  final String docId;
  const BusinessAddress(
      {super.key,
      required this.imageName,
      required this.countryController,
      required this.provinceController,
      required this.cityController,
      required this.suburbController,
      required this.streetController,
      required this.postalController,
      required this.imageChange,
      required this.lat,
      required this.long,
      required this.docId});

  @override
  State<BusinessAddress> createState() => _BusinessAddressState();
}

class _BusinessAddressState extends State<BusinessAddress> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileImage(
                    imageText: 'Logo',
                    imageName: widget.imageName,
                    imageChange: widget.imageChange,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  profileMap(
                    lat: widget.lat,
                    long: widget.long,
                    docId: widget.docId,
                  ),
                ],
              ),
              SizedBox(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileShortTextField(
                          controller: widget.countryController,
                          headline: 'Country'),
                      ProfileShortTextField(
                          controller: widget.provinceController,
                          headline: 'Province'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProfileShortTextField(
                          controller: widget.cityController, headline: 'City'),
                      ProfileShortTextField(
                          controller: widget.suburbController,
                          headline: 'Suburb'),
                    ],
                  ),
                  LongTextField(
                      controller: widget.streetController,
                      headline: 'Street Address'),
                  LongTextField(
                      controller: widget.postalController,
                      headline: 'Postal Address')
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: widthDevice < 1500
                      ? MyUtility(context).width * 0.64
                      : MyUtility(context).width * 0.71,
                  height: 1,
                  decoration: BoxDecoration(color: Color(0xFF0F253A)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
