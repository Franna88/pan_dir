import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/glassContainerWithHeight.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileDarkButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileSearchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/placeholderText.dart';

class MobileAreaSearch extends StatefulWidget {
  const MobileAreaSearch({super.key});

  @override
  State<MobileAreaSearch> createState() => _MobileAreaSearchState();
}

class _MobileAreaSearchState extends State<MobileAreaSearch> {
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
    return GlassContainerWithHeight(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            MobileMenuIndex(menuIndex: 02),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Area Search',
              style: TextStyle(
                  shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Color.fromARGB(166, 0, 0, 0),
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                  height: 1,
                  fontSize: 31,
                  fontFamily: 'ralewaybold',
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Text(
                    'Use the filter below',
                    style: TextStyle(
                      color: Color.fromARGB(255, 206, 205, 205),
                      fontSize: 14,
                      fontFamily: 'raleway',
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            MobileDarkButton(
              buttonTitle: 'Country',
              dropdownContent: const PlaceholderText(),
              isOpen: currentOpenDropdown == 0,
              onToggle: () => toggleDropdown(0),
            ),
            const SizedBox(
              height: 15,
            ),
            MobileDarkButton(
              buttonTitle: 'Province',
              dropdownContent: const PlaceholderText(),
              isOpen: currentOpenDropdown == 1,
              onToggle: () => toggleDropdown(1),
            ),
            const SizedBox(
              height: 15,
            ),
            MobileDarkButton(
              buttonTitle: 'City',
              dropdownContent: const PlaceholderText(),
              isOpen: currentOpenDropdown == 2,
              onToggle: () => toggleDropdown(2),
            ),
            const SizedBox(
              height: 15,
            ),
            MobileDarkButton(
              buttonTitle: 'Suburb',
              dropdownContent: const PlaceholderText(),
              isOpen: currentOpenDropdown == 3,
              onToggle: () => toggleDropdown(3),
            ),
            const SizedBox(
              height: 20,
            ),
            MobileSearchButton(),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
