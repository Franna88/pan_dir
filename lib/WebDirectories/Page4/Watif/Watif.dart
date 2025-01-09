import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page4/Watif/WatifDropdown.dart';
import 'package:webdirectories/myutility.dart';

class Watif extends StatefulWidget {
  const Watif({Key? key}) : super(key: key);

  @override
  State<Watif> createState() => _WatifState();
}

class _WatifState extends State<Watif> {
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage(
            'images/watifNew.png',
          ),
        ),
      ),
      height: MyUtility(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 150),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, my name is",
                        style: TextStyle(
                          fontSize: 48,
                          fontFamily: 'ralewaysemi',
                          color: Colors.black,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "watif ",
                                style: TextStyle(
                                  fontSize: 115,
                                  fontFamily: 'comfortaaBold',
                                  color: Colors.black,
                                  height: 1.1,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: SvgPicture.asset(
                              'images/tm.svg',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
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
                        ),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need fuel fast?",
                        dropdownContent:
                            "I will help you find the nearest and cheapest fuel brands in any area. View, select and navigate there instantly. Get updated info on available fuel loyalty rewards to maximize your fuel rewards.",
                        isOpen: currentOpenDropdown == 0,
                        onToggle: () => toggleDropdown(0),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need Coffee? Food?",
                        dropdownContent:
                            "Feed your travel taste buds with coffee, food, and convenience shopping. I have all the answers and specials!",
                        isOpen: currentOpenDropdown == 1,
                        onToggle: () => toggleDropdown(1),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need a restroom?",
                        dropdownContent:
                            "I will guide you to clean, accessible restrooms, pet, and child-friendly spaces.",
                        isOpen: currentOpenDropdown == 2,
                        onToggle: () => toggleDropdown(2),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need more convenience?",
                        dropdownContent:
                            "I will find you ATMs, car washes, pharmacies, courier depots, trailer hire, bus & truck stops, and many more!",
                        isOpen: currentOpenDropdown == 3,
                        onToggle: () => toggleDropdown(3),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you get car trouble?",
                        dropdownContent:
                            "I will link you to reputable roadside assistance, towing, auto repair, and panel beating services nationwide.",
                        isOpen: currentOpenDropdown == 4,
                        onToggle: () => toggleDropdown(4),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif an accident happens?",
                        dropdownContent:
                            "Help is a tap away! Get reputable roadside and towing assistance near you. Access emergency contacts on call, get your medical and insurance information, and share your location with your nominated contacts.",
                        isOpen: currentOpenDropdown == 5,
                        onToggle: () => toggleDropdown(5),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need your travel info?",
                        dropdownContent:
                            "Upload your Driver Profile that includes emergency contacts, vehicle registration and licensing, medical aid, insurance policy details, and vehicle tracking information.",
                        isOpen: currentOpenDropdown == 6,
                        onToggle: () => toggleDropdown(6),
                      ),
                      WatifDropdown(
                        dropdownText: "Watif you need infotainment?",
                        dropdownContent:
                            "Access your favorite tunes, podcasts, audiobooks, messaging, and map apps through my portal.",
                        isOpen: currentOpenDropdown == 7,
                        onToggle: () => toggleDropdown(7),
                        containerColor: Color(0xFF5F6368).withOpacity(0.47),
                      ),
                    ],
                  ),
                ),
                // Right side image
                // SizedBox(
                //   height: MyUtility(context).height / 1.7,
                //   child: Image.asset('images/watifNew.png'),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
