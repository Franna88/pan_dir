import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertContainerAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddAdvertPopup/AddAdvertPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/advertisement.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../PopUps/PopUpsCommon/NewDeletePopUp.dart';

class AdvertisementAlt extends StatefulWidget {
  const AdvertisementAlt({super.key});

  @override
  State<AdvertisementAlt> createState() => _AdvertisementAltState();
}

class _AdvertisementAltState extends State<AdvertisementAlt> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<AdvertisementModel> _advertData = [];
  StoredUser? user;
  bool _isLoading = true;

  final ScrollController _scrollController = ScrollController();

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
            // Fetch the image URL; if null, provide a default value (e.g., empty string)
            String image =
                await getImageUrl('listings/${doc.data()['immageFile']}') ?? '';

            // Handle potential null values for fields from Firestore
            advertList.add(AdvertisementModel(
              id: doc.id,
              dateAdded: doc.data()['dateAdded'] ?? '',
              dateUpdated: doc.data()['dateUpdated'] ?? '',
              immageDescription: doc.data()['immageDescription'] ?? '',
              immageFile: image,
              immageTitle: doc.data()['immageTitle'] ?? '',
              membersId: int.parse(user!.memberId),
              specialsOrder: doc.data()['specialsOrder'] ?? 0,
              listingsId: int.parse(user!.id),
            ));
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
    setState(() {
      _advertData.add(newAdData);
    });
  }

  void _onAdvertUpdated(AdvertisementModel updatedAdData) {
    setState(() {
      // Update the specific advertisement in the list
      int index = _advertData.indexWhere((ad) => ad.id == updatedAdData.id);
      if (index != -1) {
        _advertData[index] = updatedAdData;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: MyUtility(context).width,
        height: MyUtility(context).height,
        decoration: const BoxDecoration(color: Color(0xFF171616)),
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: MyUtility(context).width * 0.8,
                        height: MyUtility(context).height * 0.85,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: const Alignment(0.57, -0.82),
                            end: const Alignment(-0.57, 0.82),
                            colors: [
                              const Color(0x19777777),
                              Colors.white.withOpacity(0.4),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0xBF000000),
                              blurRadius: 24,
                              offset: Offset(0, 4),
                              spreadRadius: -1,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AddButton(
                                    text: 'Add New Special',
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierColor:
                                            Colors.black.withOpacity(0.5),
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            backgroundColor: Colors.transparent,
                                            insetPadding:
                                                const EdgeInsets.all(10),
                                            child: AddAdvertPopup(
                                              onAdvertAdded: _onAdvertAdded,
                                              onAdvertUpdated: _onAdvertUpdated,
                                              user: user,
                                              adCount: _advertData.length,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                              SizedBox(
                                height: MyUtility(context).height * 0.025,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Advertise Special Product offerings below.  Once uploaded, a button will appear on your business profile, “Specials”.\nIf a prospect clicks on the button it will open in a pop-up window. Offers can be edited and/or deleted 24/7.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.73,
                                      fontFamily: 'raleway',
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MyUtility(context).height * 0.025,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.6064,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.6064,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Display on Business Profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.6064,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.6064,
                                        fontFamily: 'ralewaybold',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MyUtility(context).height * 0.01,
                              ),
                              Expanded(
                                child: DraggableScrollbar.rrect(
                                  controller: _scrollController,
                                  backgroundColor: const Color(0x7F9E9E9F),
                                  alwaysVisibleScrollThumb: true,
                                  child: ListView.builder(
                                    controller: _scrollController,
                                    itemCount: _advertData.length,
                                    itemBuilder: (context, index) {
                                      final ad = _advertData[index];
                                      return AdvertContainerAlt(
                                        name: ad.immageTitle,
                                        subscription: ad.immageDescription,
                                        displayProfile: '',
                                        pressEdit: () {
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    const EdgeInsets.all(10),
                                                child: AddAdvertPopup(
                                                  onAdvertAdded: _onAdvertAdded,
                                                  onAdvertUpdated:
                                                      _onAdvertUpdated,
                                                  user: user,
                                                  adCount: _advertData.length,
                                                  advertToEdit:
                                                      ad, // Pass the advert for editing
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        pressDelete: () {
                                          // Open the delete confirmation dialog
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    EdgeInsets.all(10),
                                                child: NewDeleteButton(
                                                  documentId: ad.id,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        isEven: index % 2 == 0,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
