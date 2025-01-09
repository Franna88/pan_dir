import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/button.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';

class WatifMenu extends StatelessWidget {
  const WatifMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 1;

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            'Download your WATIF App',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 34,
                fontFamily: 'ralewaybold',
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          width: 400,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Hit the road with confidence and ditch the stress! ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: 'WATIF',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'ralewaymeduim',
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      ' is your free, all-in-one automotive app that empowers you with everything you need.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AddButton(text: "Approve Membership", onPressed: () {}),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
