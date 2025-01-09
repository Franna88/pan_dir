import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Notifications/NotificationWelcome/WelcomeComponents/OwnersMessageFeatures.dart';
import 'package:webdirectories/myutility.dart';

import '../WelcomeComponents/CommonColor.dart';

class OwnFtMessageText extends StatefulWidget {
  const OwnFtMessageText({super.key});

  @override
  State<OwnFtMessageText> createState() => _OwnFtMessageTextState();
}

class _OwnFtMessageTextState extends State<OwnFtMessageText> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 65.0, top: 20, right: 20, bottom: 20),
              child: Text(
                'Hello [Client Name]',
                style: TextStyle(
                  fontSize: 29.2,
                  fontFamily: "ralewaybold",
                  color: CommonColor().Colors5,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'On behalf of the entire Web Directories team, I\'d like to extend a warm welcome to the Auto Repair Directory! We\'re thrilled to have you join our growing network of trusted auto repair professionals.',
                    style: TextStyle(
                      fontSize: 17.64,
                      color: CommonColor().Colors5,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Web Directories has been connecting millions of drivers with the best businesses in their area for the last decade! For the last 2 years the Auto Repair Directory has become a natural extension of this mission, providing drivers with a one-stop shop to find reputable and skilled service specialists like yourself.',
                    style: TextStyle(
                      fontSize: 17.64,
                      color: CommonColor().Colors5,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.6,
                  child: Text(
                    '“You\'re now part of a community that goes beyond listings! This is your hub for collaboration, growth, and industry intel. Here, you\'ll connect with fellow specialists, unlock exclusive resources, and watch your business thrive.”\n\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFD9C32),
                      fontSize: 22.4,
                      fontFamily: 'Gloria',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Text(
                    'Owners Portal Features',
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ralewaybold',
                        color: CommonColor().Colors5),
                  ),
                ),
              ],
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OwnersMessageFeatures(
                      imagePath: 'images/ft1.png',
                      title: 'Complete Control',
                      description:
                          'Showcase your expertise and highlight your qualifications, experience, and positive customer reviews. Keep your listing fresh and informative. Update business details, showcase high-quality photos, and highlight your service offerings – all at your fingertips, anytime.',
                    ),
                    OwnersMessageFeatures(
                      imagePath: 'images/ft2.png',
                      title: 'Maximize Profitability',
                      description:
                          'Utilize the secure Peer-to-Peer Marketplace to sell surplus parts and equipment directly, eliminating middlemen fees. Need specific parts? Find them quickly and conveniently within the platform.',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OwnersMessageFeatures(
                      imagePath: 'images/ft3.png',
                      title: 'Effortless Team Management',
                      description:
                          'Grant access to additional team members, streamlining internal collaboration and maximizing efficiency.',
                    ),
                    OwnersMessageFeatures(
                      imagePath: 'images/ft4.png',
                      title: 'Gain Valuable Insights',
                      description:
                          'Leverage our data driven insights to optimize your listing, track key metrics (clicks, leads, conversions) and refine your marketing strategy for continuous growth, brand awareness and maximized Return on Investment (ROI).',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OwnersMessageFeatures(
                      imagePath: 'images/ft5.png',
                      title: 'Find Top Talent',
                      description:
                          'The integrated Job Finder tool connects you with qualified job seekers, allowing you to find your perfect hire faster and more efficiently.',
                    ),
                    OwnersMessageFeatures(
                      imagePath: 'images/ft6.png',
                      title: 'Stay Informed',
                      description:
                          'Get the latest industry updates delivered straight to your Owners Portal.',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
