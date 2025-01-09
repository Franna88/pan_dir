import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JobFinder/JobFindaContainer/DreamJob/DreamJobComp/ReuseableText.dart';
import 'package:webdirectories/myutility.dart';

class DreamJob extends StatefulWidget {
  const DreamJob({super.key});

  @override
  State<DreamJob> createState() => _DreamJobState();
}

class _DreamJobState extends State<DreamJob> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MyUtility(context).width * 0.35,
          height: MyUtility(context).height * 0.4,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("images/DreamJob.png"),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        Text(
          'Let’s get you your dream job!',
          style: TextStyle(
            color: Colors.white,
            fontSize: MyUtility(context).width * 0.0247,
            fontFamily: 'ralewaysemi',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.32,
          child: Text(
            'Introducing JobFinder, our contribution to assist job seekers looking for employment in the Auto Body Repair industry!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: MyUtility(context).width * 0.01,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width * 0.35,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReUseableText(percentage: '384+', cv: 'Current CVs'),
                ReUseableText(percentage: '2109', cv: 'Shops'),
                ReUseableText(percentage: '100%', cv: 'Free Service'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
