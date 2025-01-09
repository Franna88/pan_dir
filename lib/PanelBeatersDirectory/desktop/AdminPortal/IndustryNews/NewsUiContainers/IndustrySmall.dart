import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/IndustryComp/IndustryAddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/IndustryComp/IndustryButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/IndustryNews/IndustryComp/IndustySeoTags.dart';
import 'package:webdirectories/myutility.dart';

class IndustrySmall extends StatefulWidget {
  final String image;
  final String heading;
  final String article;
  final VoidCallback link;
  const IndustrySmall(
      {super.key,
      required this.image,
      required this.heading,
      required this.article,
      required this.link});

  @override
  State<IndustrySmall> createState() => _IndustrySmallState();
}

class _IndustrySmallState extends State<IndustrySmall> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.185,
      height: MyUtility(context).height * 0.5,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.49),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 29.67,
            offset: Offset(0, 14.84),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 600,
            height: MyUtility(context).height * 0.18,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(
                  widget.image,
                ),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(23.12),
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.31,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.heading,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.89,
                      fontFamily: 'ralewaysemi',
                    ),
                  ),
                  Text(
                    widget.article,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.28,
                      fontFamily: 'raleway',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IndustryAddButton(
                          text: 'Read More', onPressed: widget.link),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
