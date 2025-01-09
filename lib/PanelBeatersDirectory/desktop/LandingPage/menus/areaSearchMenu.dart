import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/placeholder.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButtonDark.dart';

class AreaSearch extends StatefulWidget {
  const AreaSearch({super.key});

  @override
  State<AreaSearch> createState() => _AreaSearchState();
}

class _AreaSearchState extends State<AreaSearch> {
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
        const Text(
          'Area Search',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          width: 430,
          child: Text(
            'Use the filter below',
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
          buttonTitle: 'Country',
          dropdownContent: const PlaceholderText(),
          isOpen: currentOpenDropdown == 0,
          onToggle: () => toggleDropdown(0),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDark(
          buttonTitle: 'Province',
          dropdownContent: const PlaceholderText(),
          isOpen: currentOpenDropdown == 1,
          onToggle: () => toggleDropdown(1),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDark(
          buttonTitle: 'City',
          dropdownContent: const PlaceholderText(),
          isOpen: currentOpenDropdown == 2,
          onToggle: () => toggleDropdown(2),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDark(
          buttonTitle: 'Suburb',
          dropdownContent: const PlaceholderText(),
          isOpen: currentOpenDropdown == 3,
          onToggle: () => toggleDropdown(3),
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 25,
            ),
            SearchButtonDark(),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
