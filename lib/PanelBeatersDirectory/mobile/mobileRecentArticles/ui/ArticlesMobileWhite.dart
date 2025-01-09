import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/MobileSeo.dart';
import 'package:webdirectories/myutility.dart';

class Articlesmobilewhite extends StatefulWidget {
  final String category;
  final String headline;
  final String writer;
  final String description;
  final VoidCallback onpress;
  const Articlesmobilewhite(
      {super.key,
      required this.category,
      required this.headline,
      required this.writer,
      required this.description,
      required this.onpress});

  @override
  State<Articlesmobilewhite> createState() => _ArticlesmobilewhiteState();
}

class _ArticlesmobilewhiteState extends State<Articlesmobilewhite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.04,
      decoration: ShapeDecoration(
        color: Color(0xFFF4F4F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.37),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 26.61,
            offset: Offset(0, 13.31),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 5, 2),
            child: Text(
              widget.category,
              style: TextStyle(
                fontSize: 15.94,
                fontFamily: 'ralewaybold',
                color: Color(0xFFFF8728),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 5, 2),
            child: SizedBox(
              height: MyUtility(context).height * 0.075,
              child: Text(
                widget.headline,
                style: TextStyle(
                  fontSize: 21.76,
                  fontFamily: 'ralewaysemi',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 5, 4),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 15.94,
                  color: Color(0xFF606060),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'By ',
                    style: TextStyle(
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                  TextSpan(
                    text: widget.writer,
                    style: TextStyle(
                      fontFamily: 'raleway',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2, 5, 0),
            child: SizedBox(
              child: Text(
                widget.description,
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'raleway',
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
            child: SizedBox(
              height: MyUtility(context).height * 0.05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MobileSeo(text: 'Lightstone'),
                  MobileSeo(text: 'EchoMBR'),
                  MobileSeo(text: 'KAI Results'),
                  MobileSeo(text: 'Panelbeaters'),
                  Spacer(),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: widget.onpress,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          )
        ],
      ),
    );
  }
}
