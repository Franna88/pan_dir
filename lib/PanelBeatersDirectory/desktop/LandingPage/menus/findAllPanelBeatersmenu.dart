import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/dropDownMenus/dropDownMenuWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/setYourLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/textfieldButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNearMe/ServicesNearMe.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/addressAutoCompleteField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/googleSearchWidget.dart';
import 'package:webdirectories/main.dart';
import 'package:webdirectories/routes/routerNames.dart';

class FindAllPanelBeaters extends StatefulWidget {
  final VoidCallback viewServiceDetails;
  final VoidCallback viewServicebyArea;
  final Function(Map<String, dynamic>) viewServiceByAddress;
  final VoidCallback viewServiceByKeyword;

  const FindAllPanelBeaters({
    super.key,
    required this.viewServiceDetails,
    required this.viewServiceByAddress,
    required this.viewServiceByKeyword,
    required this.viewServicebyArea,
  });

  @override
  State<FindAllPanelBeaters> createState() => _FindAllPanelBeatersState();
}

class _FindAllPanelBeatersState extends State<FindAllPanelBeaters> {
  final searchController = TextEditingController();
  int menuIndex = 2;
  int? currentOpenDropdown;
  String nearMeText = 'Click here to set your location';
  Map<String, String> address = {};
  List<dynamic> searchResults = [];
  bool isLoading = false;

  void updateIsLoading(bool value) {
    print('value: $value');
    setState(() {
      isLoading = value;
    });
  }

  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  void selectAddress(Map<String, String> data) {
    print(data);
    setState(() {
      address = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool locationSet = false;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Find All Panel Beaters',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Near Me',
          dropdownContent: DropDownMenuWidget(
            topText: 'Find your nearest Panel Beater',
            widget1: SetYourLoactionButton(),
            widget2: SearchButton(
              onTap: () => context.goNamed(Routernames.panelbeatersNearMe),
              isComingSoon: false,
            ),
          ),
          isOpen: currentOpenDropdown == 0,
          onToggle: () => toggleDropdown(0),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Any City or Street Address',
          dropdownContent: DropDownMenuWidget(
              topText: 'Find a Panel Beater by street',
              widget1: AddressAutoCompleteField(
                onSelected: selectAddress,
              ),
              widget2: SearchButton(
                onTap: () => context.goNamed(Routernames.panelbeatersByAddress,
                    pathParameters: address),
                isComingSoon: false,
              )),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Keyword Search',
          dropdownContent: DropDownMenuWidget(
              topText: 'Search by keywords within Panel Beater Directory',
              widget1: GoogleSearchWidget(
                  updateIsLoading: updateIsLoading,
                  onSearchResultsChanged: (value) {
                    searchResults = value;
                  },
                  searchController: searchController),
              widget2: SearchButton(
                waiting: isLoading,
                onTap: () async {
                  context.goNamed(Routernames.panelbeatersKeyword,
                      pathParameters: {
                        "searchData": jsonEncode(searchResults)
                      });
                },
                isComingSoon: false,
              )),
          isOpen: currentOpenDropdown == 2,
          onToggle: () => toggleDropdown(2),
        ),
        // MainButtonDirect(
        //   onTap: () => context.goNamed(Routernames.panelbeatersKeyword),
        //   buttonTitle: 'Keyword Search',
        // ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          onTap: widget.viewServicebyArea,
          buttonTitle: 'Area Search',
        ),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}
