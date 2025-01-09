import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/TeamButton.dart';
import 'package:webdirectories/myutility.dart';

class SocialsReuseable extends StatefulWidget {
  final String socials;

  const SocialsReuseable({super.key, required this.socials});

  @override
  State<SocialsReuseable> createState() => _SocialsReuseableState();
}

class _SocialsReuseableState extends State<SocialsReuseable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.335,
        height: MyUtility(context).height * 0.065,
        decoration: ShapeDecoration(
          color: Color(0x660F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.socials,
                style: TextStyle(
                  color: Color(0xFF0F253A),
                  fontSize: 20.6,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Row(
                children: [
                  TeamButton(icon: 'images/edit.svg', onPress: () {}),
                  TeamButton(icon: 'images/delete.svg', onPress: () {}),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
