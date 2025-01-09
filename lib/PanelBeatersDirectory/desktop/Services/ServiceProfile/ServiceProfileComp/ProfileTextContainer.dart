import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/CommonButtonR.dart';
import 'package:webdirectories/myutility.dart';

class ProfileTextContainer extends StatefulWidget {
  final Map<String, String> contactData;
  const ProfileTextContainer({super.key, required this.contactData});

  @override
  State<ProfileTextContainer> createState() => _ProfileTextContainerState();
}

class _ProfileTextContainerState extends State<ProfileTextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.395,
      height: MyUtility(context).height * 0.421,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 520.2,
                child: Text(
                  widget.contactData['telephone']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: 520.2,
                child: Text(
                  widget.contactData['address']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 520.2,
                child: Text(
                  '${widget.contactData['views']} Total Unique Page Views',
                  style: TextStyle(
                    color: Color(0xFFFF8728),
                    fontSize: MyUtility(context).width * 0.0115,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              CommonButtonR(
                buttonText: 'Approvals and Services',
                isComingSoon: true,
                onPress: () {},
                width: MyUtility(context).width * 0.18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
