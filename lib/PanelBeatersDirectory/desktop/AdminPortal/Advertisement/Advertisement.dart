/*import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/Advertcontainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddAdvertPopup/AddAdvertPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/advertisement.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class Advertisement extends StatefulWidget {
  const Advertisement({super.key});

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  final _firestore = FirebaseFirestore.instance;
  List<AdvertisementModel> _advertData = [];
  StoredUser? user;
  bool _isLoading = true;

  @override
  void initState() {
    _fetchAdvertData();
    super.initState();
  }

  void _fetchAdvertData() async {
    try {
      user = await getUserInfo();
      if (user == null) {
        return;
      }

      QuerySnapshot<Map<String, dynamic>> advertSnapshot = await _firestore
          .collection('specials')
          .where('listingsId', isEqualTo: int.parse(user!.id))
          .get();
      List<AdvertisementModel> advertList = [];
      List<Future<void>> futures = [];
      if (advertSnapshot.docs.isNotEmpty) {
        for (var doc in advertSnapshot.docs) {
          futures.add(() async {
            String? image =
                await getImageUrl('listings/${doc.data()['immageFile']}');
            advertList.add(AdvertisementModel(
                dateAdded: doc.data()['dateAdded'],
                dateUpdated: doc.data()['dateUpdated'],
                immageDescription: doc.data()['immageDescription'],
                immageFile: image,
                immageTitle: doc.data()['immageTitle'],
                membersId: int.parse(user!.memberId),
                specialsOrder: doc.data()['specialsOrder'],
                listingsId: int.parse(user!.id)));
          }());
        }
        await Future.wait(futures);
      }
      advertList.sort(
        (a, b) => a.specialsOrder.compareTo(b.specialsOrder),
      );

      setState(() {
        _isLoading = false;
        _advertData = advertList;
      });
    } catch (e) {
      print('error fetching advert data: $e');
    }
  }

  void _onAdvertAdded(AdvertisementModel newAdData) {
    List<AdvertisementModel> advertList = _advertData;
    advertList.add(newAdData);
    setState(() {
      _advertData = advertList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
        child: _isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Center(
                child: Container(
                  width: MyUtility(context).width * 0.75,
                  height: MyUtility(context).height * 0.9,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Advertisement',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24.48,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            AdvertButton(
                              text: 'Add Specials',
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: EdgeInsets.all(10),
                                      child: AddAdvertPopup(
                                        onAdvertAdded: _onAdvertAdded,
                                        user: user,
                                        adCount: _advertData.length,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MyUtility(context).height * 0.025,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _advertData.map((ad) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Advertcontainer(
                                  memberImage: ad.immageFile,
                                  memberName: ad.immageTitle,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
*/