import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/BusinessHours/BusinessHoursComp/DaysHours.dart';
import 'package:webdirectories/myutility.dart';

class BusinessHours extends StatefulWidget {
  final int listingId;
  const BusinessHours({super.key, required this.listingId});

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
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
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.625,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: MyUtility(context).width * 0.36,
                child: Text(
                  'Business Hours ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.016,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            _isLoading
                ? const Center(
                    child: const CircularProgressIndicator(color: Colors.white))
                : _businessHoursData.isEmpty
                    ? const Center(
                        child: Text(
                        'No Business Hours Available',
                        style: TextStyle(color: Colors.white),
                      ))
                    : Center(
                        child: SizedBox(
                          width: MyUtility(context).width * 0.36,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DaysHours(
                                days: 'Monday',
                                BusinessHOurs: _businessHoursData['mOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['mOpen']} - ${_businessHoursData['mClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Tuesday',
                                BusinessHOurs: _businessHoursData['tOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['tOpen']} - ${_businessHoursData['tClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Wednesday',
                                BusinessHOurs: _businessHoursData['wOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['wOpen']} - ${_businessHoursData['wClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Thursday',
                                BusinessHOurs: _businessHoursData['thOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['thOpen']} - ${_businessHoursData['thClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Friday',
                                BusinessHOurs: _businessHoursData['fOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['fOpen']} - ${_businessHoursData['fClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Saturday',
                                BusinessHOurs: _businessHoursData['saOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['saOpen']} - ${_businessHoursData['saClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Sunday',
                                BusinessHOurs: _businessHoursData['suOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['suOpen']} - ${_businessHoursData['suClosed']}'
                                    : 'Closed',
                              ),
                              DaysHours(
                                days: 'Public Holidays',
                                BusinessHOurs: _businessHoursData['pOpen'] !=
                                        'closed'
                                    ? '${_businessHoursData['pOpen']} - ${_businessHoursData['pClosed']}'
                                    : 'Closed',
                              ),
                            ],
                          ),
                        ),
                      ),
            Center(
              child: Container(
                width: MyUtility(context).width * 0.38,
                height: MyUtility(context).height * 0.2,
                decoration: ShapeDecoration(
                  color: Color(0xFF3C4043),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Useful Information',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MyUtility(context).width * 0.016,
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Our shop will be closed on Easter Weekend. 29 March - 02 April 2024. Please use our after hours number in case of an emergency.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MyUtility(context).width * 0.0111,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
