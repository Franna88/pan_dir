import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage5/EchoMBRMobile/EchoMBRComponents/SEOTagsMobile.dart';
import 'package:webdirectories/myutility.dart';

class EchoMBRMobile extends StatefulWidget {
  const EchoMBRMobile({super.key});

  @override
  State<EchoMBRMobile> createState() => _EchoMBRMobileState();
}

class _EchoMBRMobileState extends State<EchoMBRMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.225,
          child: Text(
            'See your Lightstone EchoMBR Results for February 2024',
            style: TextStyle(fontSize: 34, fontFamily: 'ralewaybold'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Your CSI success contributes to your business success and assists both prospects and industry users.",
            style: TextStyle(fontSize: 16, fontFamily: 'raleway'),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.015,
        ),
        Image.asset('images/nightdrive.png'),
        SizedBox(
          height: MyUtility(context).height * 0.015,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Your ultimate business tool",
            style: TextStyle(fontSize: 22, fontFamily: 'ralewaysemi'),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Your CSI success contributes to your business success and assists both prospects and industry users. Your updated Lightstone EchoMBR KAI results are now available in your online Panelbeaters Directory Profile* and your Owners Portal. * Results are public-facing for Featured Members only, you have the option to switch it off in the Owners Portal",
            style: TextStyle(fontSize: 16, fontFamily: 'raleway'),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.5,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Author: ",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'ralewayit',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SEOTagsMobile(text: 'Lightstone', onpress: () {}),
            SEOTagsMobile(text: 'EchoMBR', onpress: () {}),
            SEOTagsMobile(text: 'KAI Results', onpress: () {}),
            SEOTagsMobile(text: 'Panelbeaters', onpress: () {}),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFF0E1013), // Setting the background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Read more articles',
              style: TextStyle(
                  fontSize: 16, fontFamily: 'raleway', color: Colors.white),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.white,
                ),
                child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.1,
            ),
          ],
        ),
      ],
    );
  }
}
