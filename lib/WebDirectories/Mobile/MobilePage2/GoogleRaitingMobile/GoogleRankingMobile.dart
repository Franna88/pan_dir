import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class GoogleRankingMobile extends StatefulWidget {
  const GoogleRankingMobile({super.key});

  @override
  State<GoogleRankingMobile> createState() => _GoogleRankingMobileState();
}

class _GoogleRankingMobileState extends State<GoogleRankingMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Google Ranking',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'ralewaysemi',
                color: Color(0xFF0E1013)),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.45,
          child: Text(
            'We offer niche-specific directories with first-page Google rankings and targeted advertising, ensuring you reach potential customers actively seeking your services and driving more qualified leads to your business.',
            style: TextStyle(
                fontSize: 18, fontFamily: 'raleway', color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Collaboration',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'ralewaysemi',
                color: Color(0xFF0E1013)),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.45,
          child: Text(
            'We believe that collaboration is key to success. We encourage our employees to share ideas, work together on projects, and support each other’s growth. Our collaborative company culture allows us to provide customers with the best possible service.',
            style: TextStyle(
                fontSize: 18, fontFamily: 'raleway', color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Innovation',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'ralewaysemi',
                color: Color(0xFF0E1013)),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.45,
          child: Text(
            'We are always looking for new ways to improve our offering that is why we are continuously design, develop and evaluate our data driven products and services. We always focus on new ways to enhance user centric experiences.',
            style: TextStyle(
                fontSize: 18, fontFamily: 'raleway', color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
      ],
    );
  }
}
