import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/UIsections/BusinessDetails.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileController.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class AdminusinessSetup extends StatefulWidget {
  Function getListingId;
  AdminusinessSetup({super.key, required this.getListingId});

  @override
  State<AdminusinessSetup> createState() => _AdminusinessSetupState();
}

class _AdminusinessSetupState extends State<AdminusinessSetup> {
  final Businessprofilecontroller _controller = Businessprofilecontroller();
  final TextEditingController _textController = TextEditingController();
  bool _isLoading = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String? _userDisplayImageName;
  String businessLogo = "";
  String docId = "";
  double lat = 0.0;
  double long = 0.0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    var userId = await widget.getListingId();

    QuerySnapshot userDoc = await _firestore
        .collection('listings')
        .where('listingsId', isEqualTo: userId)
        .get();

    if (userDoc.docs.isNotEmpty) {
      try {
        // Fetch user data
        Map<String, dynamic> userData =
            userDoc.docs[0].data() as Map<String, dynamic>;

        // Fetch country data
        QuerySnapshot countrySnapshot = await _firestore
            .collection('country')
            .where('countryId', isEqualTo: userData['countryId'])
            .get();
        Map<String, dynamic> countryData =
            countrySnapshot.docs[0].data() as Map<String, dynamic>;

        // Fetch city data
        QuerySnapshot citySnapshot = await _firestore
            .collection('city')
            .where('cityId', isEqualTo: userData['cityId'])
            .get();
        Map<String, dynamic> cityData =
            citySnapshot.docs[0].data() as Map<String, dynamic>;

        // Fetch province data
        QuerySnapshot provinceSnapshot = await _firestore
            .collection('province')
            .where('provinceId', isEqualTo: userData['provinceId'])
            .get();
        Map<String, dynamic> provinceData =
            provinceSnapshot.docs[0].data() as Map<String, dynamic>;

        // Fetch suburb data
        QuerySnapshot suburbSnapshot = await _firestore
            .collection('suburb')
            .where('suburbId', isEqualTo: userData['suburbId'])
            .get();
        Map<String, dynamic> suburbData =
            suburbSnapshot.docs[0].data() as Map<String, dynamic>;

        // merge data into userData
        userData.addAll({
          'country': countryData['country'],
          'city': cityData['city'],
          'province': provinceData['province'],
          'suburb': suburbData['suburb'],
        });

        if (!mounted) return;

        setState(() {
          lat = userData['latitude'];
          long = userData['longitude'];
          _controller.setValues(userData);
          docId = userDoc.docs[0].id;
          print(userData['displayphoto']);

          _userDisplayImageName = "${userData['displayphoto']}";
          businessLogo = "${userData['listingLogo']}";
        });
      } catch (e) {
        print(e);
      }
    }

    setState(() {
      _isLoading = false;
    });
  }

  //Dialog for notification popup
  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  saveData() async {
    print('saving...');
    try {
      await _firestore
          .collection('listings')
          .doc(docId)
          .update(_controller.getValues())
          .whenComplete(
              () => descriptionDialog("Details have been saved successfully!"));
    } catch (e) {
      descriptionDialog(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Container(
            height: MyUtility(context).height,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          )
        : Column(
            children: [
              BusinessDetails(
                imageName:
                    _userDisplayImageName != null ? _userDisplayImageName! : '',
                tradingNameController: _controller.tradingNameController,
                registeredNameController: _controller.registeredNameController,
                bEEElevelController: _controller.bEEElevelController,
                imageChange: () {},
                saveData: saveData,
              ),
              BusinessAddress(
                imageName: businessLogo != null ? businessLogo! : '',
                countryController: _controller.countryController,
                cityController: _controller.cityController,
                provinceController: _controller.provinceController,
                suburbController: _controller.suburbController,
                streetController: _controller.streetController,
                postalController: _textController,
                imageChange: () {},
                lat: lat,
                long: long,
                docId: docId,
              ),
              BusinessContact(
                customerCareController: _controller.customerCareController,
                whatsappController: _controller.whatsappController,
                businessAlternativeController:
                    _controller.businessAlternativeController,
                businessFaxController: _controller.businessFaxController,
                afterHoursController: _controller.afterHoursController,
              ),
              /*BusinessDropDown(),
                MoreBusinessInfo(controller: _controller.moreInfoController),
                Container(
                  height: MyUtility(context).height * 0.6,
                  child: AddMember(),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'More Info',
                          style: TextStyle(
                            color: Color(0xFF0F253A),
                            fontSize: 20.4,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MyUtility(context).width * 0.755,
                      height: MyUtility(context).height * 0.17,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextFormField(
                          controller: _textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ServiceHours(),
                          Businessmedia(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: AddButton(
                        text: 'Save',
                        onPressed: () {
                          saveData();
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          );
  }
}
