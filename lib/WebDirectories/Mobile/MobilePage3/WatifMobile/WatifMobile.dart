import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/WatifMobile/WatifMobileComponents/WatifDropDownMobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage6/MobilePage6.dart';
import 'package:webdirectories/WebDirectories/Page3/Page3.dart';
import 'package:webdirectories/myutility.dart';

class WatifMobile extends StatefulWidget {
  const WatifMobile({super.key});

  @override
  State<WatifMobile> createState() => _WatifMobileState();
}

class _WatifMobileState extends State<WatifMobile> {
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
    return SizedBox(
      width: MyUtility(context).width * 1.2,
      child: Column(
        children: [
          Text(
            'Hello, my name is',
            style: TextStyle(fontSize: 42, fontFamily: 'ralewaysemi'),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset('images/watifLogo.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Your ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "FREE ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ralewaybold',
                        color: Colors.black,
                        // Make the text bold
                      ),
                    ),
                    TextSpan(
                      text:
                          "cloud based, voice controlled, assistance App, available 24/7",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'raleway',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center, // Align the text center
              ),
            ),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need fuel fast?",
            dropdownContent:
                "I will help you find the nearest and cheapest fuel brands in any area. View, select and navigate there instantly. Get updated info on available fuel loyalty rewards to maximize your fuel rewards.",
            isOpen: currentOpenDropdown == 0,
            onToggle: () => toggleDropdown(0),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need Coffee? Food?",
            dropdownContent:
                "Feed your travel taste buds with coffee, food and convenience shopping. I have all the answers and specials! ",
            isOpen: currentOpenDropdown == 1,
            onToggle: () => toggleDropdown(1),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need a restroom??",
            dropdownContent:
                "I will guide you to clean, accessible restrooms, pet and child friendly spaces.",
            isOpen: currentOpenDropdown == 2,
            onToggle: () => toggleDropdown(2),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need more convenience?",
            dropdownContent:
                "I will find you ATM’s, car washes, pharmacies, courier depots, trailer hire, bus & truck stops and many more! ",
            isOpen: currentOpenDropdown == 3,
            onToggle: () => toggleDropdown(3),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you get car trouble?",
            dropdownContent:
                "I will link you to reputable roadside assistance-, towing-, auto repair-, and panel beating services nationwide. ",
            isOpen: currentOpenDropdown == 4,
            onToggle: () => toggleDropdown(4),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif an accident happens?",
            dropdownContent:
                "Help is a tap away! Get reputable roadside- and towing assistance near you. Access emergency contacts on call, get your medical and insurance information, and share your location to your nominated contacts.",
            isOpen: currentOpenDropdown == 5,
            onToggle: () => toggleDropdown(5),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need your travel info?",
            dropdownContent:
                "Upload your Driver Profile that includes emergency contacts, vehicle registration and licensing, medical aid, insurance policy details and vehicle tracking information.",
            isOpen: currentOpenDropdown == 6,
            onToggle: () => toggleDropdown(6),
            textColor: Color(0xFF0E1013),
          ),
          WatifDropDownMobile(
            dropdownText: "Watif you need infotainment?",
            dropdownContent:
                "Access your favourite tunes, podcasts, audio books, messaging and map apps through my portal. ",
            isOpen: currentOpenDropdown == 7,
            onToggle: () => toggleDropdown(7),
            textColor: Color(0xFF5F6368).withOpacity(0.47),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Container(
              width: MyUtility(context).width / 1.2,
              child: Image.asset('images/coffeendrive.png')),
          SizedBox(
            height: MyUtility(context).height * 0.03,
          ),
          Text(
            "Download",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'ralewaysemi',
              color: Colors.black,
              height: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: 150,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Text(
                  "watif",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'comfortaaBold',
                    color: Color(0xFFCFD300),
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'images/tm.svg',
                    height: 15,
                    width: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              "for mahala, free, verniet...",
              style: TextStyle(
                  fontSize: 26, fontFamily: 'ralewaysemi', color: Colors.black),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.1,
            child: const Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Hit the road with confidence and ditch the stress! ',
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'raleway', color: Colors.black),
                ),
                TextSpan(
                  text: 'watif ',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'comfortaaMedium',
                      color: Colors.black),
                ),
                TextSpan(
                  text:
                      "is your free, all-in-one automotive app that empowers you with everything you need.",
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'raleway', color: Colors.black),
                )
              ],
            )),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/appmobile.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/googlemobile.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                height: 45,
                width: 110,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/windowsmobile.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Material(
                              child: MobilePage6(),
                            )));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0E1013),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.zero,
                    child: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.02,
                  ),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0,
                      fontFamily: 'raleway',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          Container(
            height: MyUtility(context).height * 0.04,
            width: MyUtility(context).width * 0.45,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/starsmobile.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
        ],
      ),
    );
  }
}
