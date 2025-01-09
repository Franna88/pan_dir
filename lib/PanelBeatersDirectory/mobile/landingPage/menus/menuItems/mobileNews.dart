import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/directOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/landingPage/ui/mobileMenuIndex.dart';

class MobileNews extends StatelessWidget {
  const MobileNews({super.key});

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    int menuIndex = 4;
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
        Text(
          'Info & Finance',
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
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Discover the latest updates in the world of Auto Body\nRepair. Stay informed with our informative articles.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: widthDevice < 400 ? 16 : 19.72,
              fontFamily: 'raleway',
              height: 1.15,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
          buttonTitle: 'News & Articles',
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
          buttonTitle: 'CSI Lightstone EchoMBR',
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
          buttonTitle: 'Industry News',
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
        DirectOrangeButton(
          buttonTitle: 'Repair Finance',
          onPressed: () {},
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
