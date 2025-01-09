import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsLeftContenMobile/AboutUsLeftContentComp/SocialIconsMobile.dart';

import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsLeftContenMobile/AboutUsLeftContentMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AboutServicesMobile/AboutUsTextContainer/AboutUsTextContainerMobile.dart';
import 'package:webdirectories/myutility.dart';

class AboutServicesMobile extends StatefulWidget {
  final int listingsId;
  final String beeLevel;
  const AboutServicesMobile(
      {super.key, required this.listingsId, required this.beeLevel});

  @override
  State<AboutServicesMobile> createState() => _AboutServicesMobileState();
}

class _AboutServicesMobileState extends State<AboutServicesMobile> {
  final _firestore = FirebaseFirestore.instance;
  String _aboutUsText = '';
  List<String> _registrationLeftData = [];
  List<String> _registrationRightData = [];
  List<Map<String, dynamic>> _linksData = [];
  bool _isLoading = true;
  @override
  void initState() {
    _fetchAboutData();
    super.initState();
  }

  Future<void> _fetchAboutData() async {
    try {
      List<String> registrationLeftData = ['B-BBEE Level'];
      List<String> registrationRightData = [widget.beeLevel];

      // Fetch more info data
      QuerySnapshot moreInfoSnapshot = await _firestore
          .collection('listing_more_info')
          .where('listingsId', isEqualTo: widget.listingsId)
          .get();
      Map<String, dynamic> moreInfoData = {};
      if (moreInfoSnapshot.docs.isNotEmpty) {
        moreInfoData =
            moreInfoSnapshot.docs.first.data() as Map<String, dynamic>;
      }

      // Fetch registration data
      QuerySnapshot registrationDataSnapshot = await _firestore
          .collection('registration_numbers')
          .where('listingsId', isEqualTo: widget.listingsId)
          .get();

      if (registrationDataSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> registrationData =
            await registrationDataSnapshot.docs
                .map((doc) => doc.data() as Map<String, dynamic>)
                .toList();

        for (var registration in registrationData) {
          QuerySnapshot registrationTypeSnapshot = await _firestore
              .collection('registration_type')
              .where('registrationTypeId',
                  isEqualTo: registration['registrationTypeId'])
              .get();

          Map<String, dynamic> registrationTypeData =
              registrationTypeSnapshot.docs.first.data()
                  as Map<String, dynamic>;

          String registrationTypeName =
              registrationTypeData['registrationType'];
          registrationLeftData.add(registrationTypeName);
          registrationRightData
              .add(registration['registrationNumbers'].toString());
        }
      }

      // Fetch links data
      QuerySnapshot linksDataSnapshot = await _firestore
          .collection('listings_links')
          .where('listingsId', isEqualTo: widget.listingsId)
          .get();
      List<Map<String, dynamic>> linksData = linksDataSnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      if (linksDataSnapshot.docs.isNotEmpty) {
        linksData = linksDataSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      }

      setState(() {
        _aboutUsText = moreInfoData['moreInfo'] ?? '';
        _registrationLeftData = registrationLeftData;
        _registrationRightData = registrationRightData;
        _linksData = linksData;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox(
            height: MyUtility(context).height * 0.8,
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ))
        : Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AboutUsLeftContentMobile(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 440.88,
                      height: MyUtility(context).height * 0.03,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Other Media:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.4,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SocialIconsMobile(
                      socialIconsList: _linksData,
                    ),
                  )
                ],
              ),
              AboutUsTextContainerMobile(
                aboutUsText: _aboutUsText,
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          );
  }
}
