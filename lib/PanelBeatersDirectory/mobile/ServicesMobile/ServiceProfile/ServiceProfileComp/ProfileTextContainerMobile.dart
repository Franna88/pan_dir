import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ProfileTextContainerMobile extends StatefulWidget {
  final Map<String, String> contactData;
  ProfileTextContainerMobile({super.key, required this.contactData});

  @override
  State<ProfileTextContainerMobile> createState() =>
      _ProfileTextContainerMobileState();
}

class _ProfileTextContainerMobileState
    extends State<ProfileTextContainerMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      height: MyUtility(context).height * 0.3,
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
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
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
                  fontSize: 15.64,
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
                  fontSize: 15.64,
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
                '${200 + Random().nextInt(801)} Total Unique Page Views',
                style: TextStyle(
                  color: Color(0xFFFF8728),
                  fontSize: 15.64,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MyUtility(context).width * 0.55,
                    height: MyUtility(context).height * 0.05,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 26.5744,
                          height: 26.5744,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Approvals & Services',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.8999999761581421),
                            fontSize: 15.64,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
