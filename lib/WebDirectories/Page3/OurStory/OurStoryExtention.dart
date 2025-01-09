import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class OurStoryExtention extends StatefulWidget {
  const OurStoryExtention({super.key});

  @override
  State<OurStoryExtention> createState() => _OurStoryExtentionState();
}

class _OurStoryExtentionState extends State<OurStoryExtention> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MyUtility(context).width * 0.17,
          child: const Column(
            children: [
              Text(
                'Google Rankings',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E1013),
                  fontFamily: 'ralewaysemi',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We offer niche-specific\ndirectories with first-page Google\nrankings and targeted\nadvertising, ensuring you reach\npotential customers actively\nseeking your services and driving\nmore qualified leads to your\nbusiness.',
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.black,
                  fontFamily: 'raleway',
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.17,
          child: const Column(
            children: [
              Text(
                'Collaboration',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'ralewaysemi',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We believe that collaboration is\nkey to success. We encourage\nour employees to share ideas,\nwork together on projects, and\nsupport each other’s growth. Our\ncollaborative company culture\nallows us to provide customers\nwith the best possible service.',
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.black,
                  fontFamily: 'raleway',
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.170,
          child: const Column(
            children: [
              Text(
                'Innovation',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E1013),
                  fontFamily: 'ralewaysemi',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                'We are always looking for new\nways to improve our offering that\nis why we are continuously\ndesign, develop and evaluate our\ndata driven products and\nservices. We always focus on new\nways to enhance user centric\nexperiences.',
                style: TextStyle(
                  fontSize: 15.5,
                  color: Colors.black,
                  fontFamily: 'raleway',
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
