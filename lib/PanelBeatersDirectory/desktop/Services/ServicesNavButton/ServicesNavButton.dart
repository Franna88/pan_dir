import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNavButton/ServicesNavButtonComp/NavButton.dart';
import 'package:webdirectories/myutility.dart';

class ServicesNavButton extends StatefulWidget {
  Function(int) updatePageIndex;
  final String listingTitle;
  ServicesNavButton(
      {Key? key, required this.updatePageIndex, required this.listingTitle})
      : super(key: key);

  @override
  State<ServicesNavButton> createState() => _ServicesNavButtonState();
}

class _ServicesNavButtonState extends State<ServicesNavButton> {
  String selectedNav = 'Profile'; // Initial selection

  void _onNavButtonTap(String navText, int value) {
    setState(() {
      selectedNav = navText;
      widget.updatePageIndex(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MyUtility(context).width * 0.31,
          height: MyUtility(context).height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xFFFF8828),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Text(
              widget.listingTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: MyUtility(context).width * 0.0145,
                fontFamily: 'raleway',
              ),
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.85,
          height: MyUtility(context).height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavButton(
                navIcon: 'images/compassprofile.svg',
                navText: 'Profile',
                isSelected: selectedNav == 'Profile',
                onTap: () => _onNavButtonTap('Profile', 0),
              ),
              NavButton(
                navIcon: 'images/contact.svg',
                navText: 'Contact',
                isSelected: selectedNav == 'Contact',
                onTap: () => _onNavButtonTap('Contact', 1),
              ),
              NavButton(
                navIcon: 'images/maps.svg',
                navText: 'Maps',
                isSelected: selectedNav == 'Maps',
                onTap: () => _onNavButtonTap('Maps', 2),
              ),
              NavButton(
                navIcon: 'images/accreditations.svg',
                navText: 'Accreditations',
                isSelected: selectedNav == 'Accreditations',
                onTap: () => _onNavButtonTap('Accreditations', 3),
              ),
              NavButton(
                navIcon: 'images/About.svg',
                navText: 'About',
                isSelected: selectedNav == 'About',
                onTap: () => _onNavButtonTap('About', 4),
              ),
              NavButton(
                navIcon: 'images/Documents.svg',
                navText: 'Documents',
                isSelected: selectedNav == 'Documents',
                onTap: () => _onNavButtonTap('Documents', 5),
              ),
              NavButton(
                navIcon: 'images/Reviews.svg',
                navText: 'Reviews',
                isSelected: selectedNav == 'Reviews',
                onTap: () => _onNavButtonTap('Reviews', 6),
              ),
              NavButton(
                navIcon: 'images/Finance.svg',
                navText: 'Finance',
                isSelected: selectedNav == 'Finance',
                onTap: () => _onNavButtonTap('Finance', 7),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
