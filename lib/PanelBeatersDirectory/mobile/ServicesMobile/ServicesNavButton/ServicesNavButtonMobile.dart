import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/ServicesNavButton/ServicesNavButtonComp/MobileNavButton.dart';
import 'package:webdirectories/myutility.dart';

class ServicesNavButtonMobile extends StatefulWidget {
  Function(int) updatePageIndex;
  ServicesNavButtonMobile({Key? key, required this.updatePageIndex})
      : super(key: key);

  @override
  State<ServicesNavButtonMobile> createState() =>
      _ServicesNavButtonMobileState();
}

class _ServicesNavButtonMobileState extends State<ServicesNavButtonMobile> {
  String selectedNav = 'Profile'; // Initial selection

// this function updates page index
  void _onNavButtonTap(String navText, int index) {
    setState(() {
      selectedNav = navText;
      widget.updatePageIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MyUtility(context).width * 0.9,
          height: MyUtility(context).height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFFFF8828),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              'N4 Autocraft Panelbeaters - Pretoria East',
              style: TextStyle(
                color: Colors.black,
                fontSize: MyUtility(context).width * 0.042,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.9,
          height: MyUtility(context).height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MobileNavButton(
                    navIcon: 'images/compass.svg',
                    navText: 'Profile',
                    isSelected: selectedNav == 'Profile',
                    onTap: () => _onNavButtonTap('Profile', 0),
                  ),
                  MobileNavButton(
                    navIcon: 'images/contact.svg',
                    navText: 'Contact',
                    isSelected: selectedNav == 'Contact',
                    onTap: () => _onNavButtonTap('Contact', 1),
                  ),
                  MobileNavButton(
                    navIcon: 'images/maps.svg',
                    navText: 'Maps',
                    isSelected: selectedNav == 'Maps',
                    onTap: () => _onNavButtonTap('Maps', 2),
                  ),
                  MobileNavButton(
                    navIcon: 'images/accreditations.svg',
                    navText: 'Accreditations',
                    isSelected: selectedNav == 'Accreditations',
                    onTap: () => _onNavButtonTap('Accreditations', 3),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MobileNavButton(
                    navIcon: 'images/About.svg',
                    navText: 'About',
                    isSelected: selectedNav == 'About',
                    onTap: () => _onNavButtonTap('About', 4),
                  ),
                  MobileNavButton(
                    navIcon: 'images/Documents.svg',
                    navText: 'Documents',
                    isSelected: selectedNav == 'Documents',
                    onTap: () => _onNavButtonTap('Documents', 5),
                  ),
                  MobileNavButton(
                    navIcon: 'images/Reviews.svg',
                    navText: 'Reviews',
                    isSelected: selectedNav == 'Reviews',
                    onTap: () => _onNavButtonTap('Reviews', 6),
                  ),
                  MobileNavButton(
                    navIcon: 'images/Finance.svg',
                    navText: 'Finance',
                    isSelected: selectedNav == 'Finance',
                    onTap: () => _onNavButtonTap('Finance', 7),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
