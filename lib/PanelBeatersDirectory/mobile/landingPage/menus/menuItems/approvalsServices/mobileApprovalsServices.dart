import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileDropDown.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileSearchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileSetLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileTextField.dart';

class MobileApprovalsServices extends StatefulWidget {
  const MobileApprovalsServices({super.key});

  @override
  State<MobileApprovalsServices> createState() =>
      _MobileApprovalsServicesState();
}

class _MobileApprovalsServicesState extends State<MobileApprovalsServices> {
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
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 15,
        ),
        MobileMenuIndex(menuIndex: menuIndex),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child:  Text(
            'Approvals & Services',
            textAlign: TextAlign.center,
            style: TextStyle(
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Color.fromARGB(166, 0, 0, 0),
                    offset: Offset(1.0, 1.0),
                  ),
                ],
                fontSize: widthDevice < 400 ? 30 : 34,
                height: 1.15,
                fontFamily: 'ralewaybold',
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MobileOrangeButton(
          buttonTitle: 'Near Me',
          dropdownContent: const MobileDropDown(
              topText: 'Find your nearest Panel Beater',
              widget1: MobileSetLocationButton(),
              widget2: MobileSearchButton()),
          isOpen: currentOpenDropdown == 0,
          onToggle: () => toggleDropdown(0),
        ),
        const SizedBox(
          height: 15,
        ),
        MobileOrangeButton(
          buttonTitle: 'Any City or Street Address',
          dropdownContent: const MobileDropDown(
              topText: 'Find a Panel Beater by street',
              widget1:
                  MobileTextfield(hintText: 'Type any street address here'),
              widget2: MobileSearchButton()),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
