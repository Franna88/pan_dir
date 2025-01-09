import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesByAddress/servicesByAddressSearch.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/addressAutoCompleteField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/googleSearchWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesNearMe/mobileServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/directOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileSearchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileSetLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesByAddress/mobileServicesByAddress.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/searchListings/mobileServicesByArea/mobileServicesByArea.dart';
import 'package:webdirectories/routes/routerNames.dart';

class MobileFindAllPanelBeaters extends StatefulWidget {
  const MobileFindAllPanelBeaters({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileFindAllPanelBeaters> createState() =>
      _MobileFindAllPanelBeatersState();
}

class _MobileFindAllPanelBeatersState extends State<MobileFindAllPanelBeaters> {
  final searchController = TextEditingController();
  int menuIndex = 2;
  int? currentOpenDropdown;
  Map<String, dynamic> address = {};
  bool isLoading = false;
  List<dynamic> searchResults = [];
  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  void selectAddress(Map<String, dynamic> data) {
    print(data);
    setState(() {
      address = data;
    });
  }

  void updateIsLoading(bool value) {
    print('value: $value');
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    bool locationSet = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        MobileMenuIndex(menuIndex: menuIndex),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Find All Panel Beaters',
            textAlign: TextAlign.center,
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(166, 0, 0, 0),
                  offset: Offset(1.0, 1.0),
                ),
              ],
              height: 1.15,
              fontSize: widthDevice < 400 ? 30 : 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MobileOrangeButton(
          buttonTitle: 'Near Me',
          dropdownContent: MobileDropDown(
            topText: 'Find your nearest Panel Beater',
            widget1: MobileSetLocationButton(),
            widget2: MobileSearchButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MobileServicesNearMe()),
                );
              },
            ),
          ),
          isOpen: currentOpenDropdown == 0,
          onToggle: () => toggleDropdown(0),
        ),
        const SizedBox(
          height: 15,
        ),
        MobileOrangeButton(
          buttonTitle: 'Any City or Street Address',
          dropdownContent: MobileDropDown(
              topText: 'Find a Panel Beater by street',
              widget1: AddressAutoCompleteField(onSelected: selectAddress),
              widget2: MobileSearchButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobileServicesByAddress(
                              addressData: address,
                            )),
                  );
                },
              )),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 15,
        ),
        MobileOrangeButton(
          buttonTitle: 'Keyword Search',
          dropdownContent: MobileDropDown(
              topText: 'Search by keywords within Panel Beater Directory',
              widget1: GoogleSearchWidget(
                  updateIsLoading: updateIsLoading,
                  onSearchResultsChanged: (value) {
                    searchResults = value;
                  },
                  searchController: searchController),
              widget2: MobileSearchButton(
                onPressed: () async {
                  context.goNamed(Routernames.panelbeatersKeyword,
                      pathParameters: {
                        "searchData": jsonEncode(searchResults)
                      });
                },
              )),
          isOpen: currentOpenDropdown == 2,
          onToggle: () => toggleDropdown(2),
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MobileServicesByArea()),
            );
          },
          buttonTitle: 'Area Search',
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
