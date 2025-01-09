import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/placeholder.dart';

class ApprovalsServicesDark extends StatefulWidget {
  const ApprovalsServicesDark({super.key});

  @override
  State<ApprovalsServicesDark> createState() => _ApprovalsServicesState();
}

class _ApprovalsServicesState extends State<ApprovalsServicesDark> {
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
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      const Text(
        'Approvals & Services',
        style: TextStyle(
            fontSize: 34,
            fontFamily: 'ralewaybold',
            color: Color.fromARGB(255, 255, 255, 255)),
      ),
      const SizedBox(
        width: 430,
        child: Text(
          'Please select one option',
          style: TextStyle(
            color: Color.fromARGB(255, 206, 205, 205),
            fontSize: 16,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      MainButtonDark(
        buttonTitle: 'Specialist Services',
        dropdownContent: const PlaceholderText(),
        isOpen: currentOpenDropdown == 0,
        onToggle: () => toggleDropdown(0),
      ),
      const SizedBox(
        height: 15,
      ),
      MainButtonDark(
        buttonTitle: 'Insurance Panel',
        dropdownContent: const PlaceholderText(),
        isOpen: currentOpenDropdown == 1,
        onToggle: () => toggleDropdown(1),
      ),
      const SizedBox(
        height: 15,
      ),
      MainButtonDark(
        buttonTitle: 'Vehicle Brand',
        dropdownContent: const PlaceholderText(),
        isOpen: currentOpenDropdown == 2,
        onToggle: () => toggleDropdown(2),
      ),
      const SizedBox(
        height: 15,
      ),
      MainButtonDark(
        buttonTitle: 'Commercial Vehicle Brand',
        dropdownContent: const PlaceholderText(),
        isOpen: currentOpenDropdown == 3,
        onToggle: () => toggleDropdown(3),
      ),
      const SizedBox(
        height: 15,
      ),
      MainButtonDark(
        buttonTitle: 'Commercial Vehicle Services',
        dropdownContent: const PlaceholderText(),
        isOpen: currentOpenDropdown == 4,
        onToggle: () => toggleDropdown(4),
      ),
      const SizedBox(
        height: 25,
      ),
    ]);
  }
}
