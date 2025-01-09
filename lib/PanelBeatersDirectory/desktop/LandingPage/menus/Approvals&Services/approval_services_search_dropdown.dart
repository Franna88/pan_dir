import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/dropDownMenus/dropDownMenuWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/setYourLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/textfieldButton.dart';

class ApprovalServicesSearchDropdown extends StatefulWidget {
  const ApprovalServicesSearchDropdown({super.key});

  @override
  State<ApprovalServicesSearchDropdown> createState() =>
      _ApprovalServicesSearchDropdownState();
}

class _ApprovalServicesSearchDropdownState
    extends State<ApprovalServicesSearchDropdown> {
  int menuIndex = 3;

  int? currentOpenDropdown;

  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Approvals & Services',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButton(
          buttonTitle: 'Special Services',
          dropdownContent: DropDownMenuWidget(
              topText: 'Find your nearest Panel Beater',
              widget1: SetYourLoactionButton(),
              widget2: SearchButton(
                isComingSoon: true,
              )),
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
              widget1:
                  TextfieldButton(hintText: 'Type any street address here'),
              widget2: SearchButton(
                isComingSoon: true,
              )),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }
}
