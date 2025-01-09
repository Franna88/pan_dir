import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/MoreInfoAlt/MoreInfoEditor.dart';
import 'package:webdirectories/myutility.dart';

class MoreInfoALt extends StatefulWidget {
  Function getListingId;
  MoreInfoALt({super.key, required this.getListingId});

  @override
  State<MoreInfoALt> createState() => _MoreInfoALtState();
}

class _MoreInfoALtState extends State<MoreInfoALt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.5, top: 12.5, left: 20),
              child: Text(
                'To maintain system security and reliability, please avoid uploading images or links. All posts are subject to moderation.',
                style: TextStyle(
                  color: Color(0xFFD17226),
                  fontSize: 13.7364,
                  fontFamily: 'ralewaysemi',
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
              width: MyUtility(context).width * 0.9,
              height: MyUtility(context).height * 0.8,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xBF000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                minLines: 8,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                ),
                style: TextStyle(
                    color: Colors.white), // Set the input text color to white
              ),
            ),*/
                  MoreInfoEditor()),
        ),
      ],
    );
  }
}
