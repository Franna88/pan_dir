import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/glassContainerWithHeight.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileDarkButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/placeholderText.dart';

class MobileDarkApprovals extends StatefulWidget {
  const MobileDarkApprovals({super.key});

  @override
  State<MobileDarkApprovals> createState() => _MobileDarkApprovalsState();
}

class _MobileDarkApprovalsState extends State<MobileDarkApprovals> {
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            height: 15,
          ),
          MobileMenuIndex(menuIndex: 03),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              textAlign: TextAlign.center,
              'Approvals & Services',
              style: TextStyle(
                  fontSize: 31,
                  height: 1,
                  fontFamily: 'ralewaybold',
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please select one option',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromARGB(255, 206, 205, 205),
              fontSize: 14,
              fontFamily: 'raleway',
              height: 1,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          MobileDarkButton(
            buttonTitle: 'Specialist Services',
            dropdownContent: const PlaceholderText(),
            isOpen: currentOpenDropdown == 0,
            onToggle: () => toggleDropdown(0),
          ),
          const SizedBox(
            height: 15,
          ),
          MobileDarkButton(
            buttonTitle: 'Insurance Panel',
            dropdownContent: const PlaceholderText(),
            isOpen: currentOpenDropdown == 1,
            onToggle: () => toggleDropdown(1),
          ),
          const SizedBox(
            height: 15,
          ),
          MobileDarkButton(
            buttonTitle: 'Vehicle Brand',
            dropdownContent: const PlaceholderText(),
            isOpen: currentOpenDropdown == 2,
            onToggle: () => toggleDropdown(2),
          ),
          const SizedBox(
            height: 15,
          ),
          MobileDarkButton(
            buttonTitle: 'Commercial Vehicle Brand',
            dropdownContent: const PlaceholderText(),
            isOpen: currentOpenDropdown == 3,
            onToggle: () => toggleDropdown(3),
          ),
          const SizedBox(
            height: 15,
          ),
          MobileDarkButton(
            buttonTitle: 'Commercial Vehicle Services',
            dropdownContent: const PlaceholderText(),
            isOpen: currentOpenDropdown == 4,
            onToggle: () => toggleDropdown(4),
          ),
          const SizedBox(
            height: 15,
          ),
        ]),
      ),
    );
  }
}
