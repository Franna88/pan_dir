import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';

class FuelTowingRepairMenu extends StatelessWidget {
  const FuelTowingRepairMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    int menuIndex = 5;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Fuel, Towing & Repair',
          textAlign: TextAlign.center,
          style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Color.fromARGB(166, 0, 0, 0),
                  offset: Offset(1.0, 1.0),
                ),
              ],
              fontSize: 34,
              height: 1.15,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        Padding(
          padding: EdgeInsets.only(left: widthDevice * 0.03),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Locate and navigate to other service directories.',
              style: TextStyle(
                color: Color.fromARGB(255, 206, 205, 205),
                fontSize: 16,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Fuel, Food & Pricing',
          onTap: () {},
          isComingSoon: true,
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Repair, Parts & Tyres',
          onTap: () {},
          isComingSoon: true,
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Towing Services',
          onTap: () {},
          isComingSoon: true,
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Emergency on Call',
          onTap: () {},
          isComingSoon: true,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
