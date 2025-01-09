import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/directOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';

class MobileFuelTowing extends StatelessWidget {
  const MobileFuelTowing({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    int menuIndex = 5;
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
          child: Text(
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
              height: 1.15,
              fontSize: widthDevice < 400 ? 30 : 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Locate and navigate to other service directories.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: widthDevice < 400 ? 16 : 19.0,
              height: 1.1,
              fontFamily: 'raleway',
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
            buttonTitle: 'Fuel, Food & Pricing', onPressed: () {}),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
            buttonTitle: 'Repair, Parts & Tyres', onPressed: () {}),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(buttonTitle: 'Towing Services', onPressed: () {}),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(buttonTitle: 'Emergency on Call', onPressed: () {}),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
