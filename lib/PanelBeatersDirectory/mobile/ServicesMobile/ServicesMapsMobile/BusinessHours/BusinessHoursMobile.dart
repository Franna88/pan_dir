import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesMapsMobile/BusinessHours/BusinessHoursMobileComp/DaysHoursMobile.dart';
import 'package:webdirectories/myutility.dart';

class BusinessHoursMobile extends StatefulWidget {
  final int listingId;
  const BusinessHoursMobile({super.key, required this.listingId});

  @override
  State<BusinessHoursMobile> createState() => _BusinessHoursMobileState();
}

class _BusinessHoursMobileState extends State<BusinessHoursMobile> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _businessHoursData = {};
  bool _isLoading = true;
  @override
  void initState() {
    _getBusinessHoursData();
    super.initState();
  }

  Future<void> _getBusinessHoursData() async {
    try {
      QuerySnapshot businessHoursSnapshot = await _firestore
          .collection('listing_hours')
          .where('listingsId', isEqualTo: widget.listingId)
          .get();

      if (businessHoursSnapshot.docs.isNotEmpty) {
        setState(() {
          _businessHoursData = businessHoursSnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList()[0];
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching business hours data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: const CircularProgressIndicator(color: Colors.white))
        : _businessHoursData.isEmpty
            ? const Center(
                child: Text(
                'No Business Hours Available',
                style: TextStyle(color: Colors.white),
              ))
            : Container(
                width: MyUtility(context).width * 0.9,
                height: MyUtility(context).height * 0.52,
                decoration: ShapeDecoration(
                  color: Color(0xFF181B1D),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Text(
                          'Business Hours ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.4,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 20, 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Column(
                                children: [
                                  DaysHoursMobile(
                                    days: 'Monday',
                                    BusinessHOurs: _businessHoursData[
                                                'mOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['mOpen']} - ${_businessHoursData['mClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Tuesday',
                                    BusinessHOurs: _businessHoursData[
                                                'tOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['tOpen']} - ${_businessHoursData['tClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Wednesday',
                                    BusinessHOurs: _businessHoursData[
                                                'wOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['wOpen']} - ${_businessHoursData['wClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Thursday',
                                    BusinessHOurs: _businessHoursData[
                                                'thOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['thOpen']} - ${_businessHoursData['thClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Friday',
                                    BusinessHOurs: _businessHoursData[
                                                'fOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['fOpen']} - ${_businessHoursData['fClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Saturday',
                                    BusinessHOurs: _businessHoursData[
                                                'saOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['saOpen']} - ${_businessHoursData['saClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Sunday',
                                    BusinessHOurs: _businessHoursData[
                                                'suOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['suOpen']} - ${_businessHoursData['suClosed']}'
                                        : 'Closed',
                                  ),
                                  DaysHoursMobile(
                                    days: 'Public Holidays',
                                    BusinessHOurs: _businessHoursData[
                                                'pOpen'] !=
                                            'closed'
                                        ? '${_businessHoursData['pOpen']} - ${_businessHoursData['pClosed']}'
                                        : 'Closed',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MyUtility(context).width * 0.85,
                            height: MyUtility(context).height * 0.17,
                            decoration: ShapeDecoration(
                              color: Color(0xFF3C4043),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Useful Information',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.4,
                                            fontFamily: 'raleway',
                                            fontWeight: FontWeight.w400,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Our shop will be closed on Easter Weekend.\n29 March - 02 April 2024. Please use our after hours number in case of an\nemergency.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.64,
                                      fontStyle: FontStyle.italic,
                                      fontFamily: 'ralewayit',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
  }
}
