import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page3/Our%20Eagle%20Proclamation/OurEagleProclamationComponents/EagleContainer.dart';
import 'package:webdirectories/myutility.dart';

class OurEagleProclamation extends StatefulWidget {
  const OurEagleProclamation({super.key});

  @override
  State<OurEagleProclamation> createState() => _OurEagleProclamationState();
}

class _OurEagleProclamationState extends State<OurEagleProclamation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF0E1013),
          border: Border(
              bottom: BorderSide(
                  color: Colors.white.withOpacity(0.38), width: 0.5))),
      width: MyUtility(context).width,
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.025,
          ),
          Text(
            "Our Eagle Proclamation",
            style: TextStyle(
                fontSize: 48, fontFamily: 'ralewaysemi', color: Colors.white),
          ),
          Text(
            "Our Vision in Action",
            style: TextStyle(
                fontSize: 24, fontFamily: 'ralewaymedium', color: Colors.white),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EagleProclamation(
                  image: "images/eagle1.png",
                  headlinetext: "Our Actions:\nRak Chazak Amatz\n",
                  text: "Joshua 1:7"),
              EagleProclamation(
                  image: "images/eagle2.png",
                  headlinetext: " Without Vision\nPeople Perish \n",
                  text: "Proverbs 29:18"),
              EagleProclamation(
                  image: "images/eagle3.png",
                  headlinetext: "We will never forget who gives us Eagle Wings",
                  text: "Isaiah 40:31"),
              EagleProclamation(
                  image: "images/eagle4.png",
                  headlinetext: "Our Plan:\nWe can do Anything through Christ",
                  text: "Philippians 4:13"),
              EagleProclamation(
                  image: "images/eagle5.png",
                  headlinetext: "Our Creed: Raptare!Seize the Moment!\n",
                  text: "Luke 9:62"),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.1,
          )
        ],
      ),
    );
  }
}
