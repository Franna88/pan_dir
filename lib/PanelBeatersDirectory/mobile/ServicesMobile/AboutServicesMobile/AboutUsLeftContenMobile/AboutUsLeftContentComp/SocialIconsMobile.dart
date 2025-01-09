import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../../desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContentComp/SvgPictureButton.dart';
import 'SvgPictureButtonMobile.dart';

class SocialIconsMobile extends StatefulWidget {
  final List<Map<String, dynamic>> socialIconsList;
  const SocialIconsMobile({super.key, required this.socialIconsList});

  @override
  State<SocialIconsMobile> createState() => _SocialIconsMobileState();
}

class _SocialIconsMobileState extends State<SocialIconsMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.socialIconsList.map((e) {
            switch (e['linkTitle']) {
              case 'Facebook':
                return SvgPictureButtonMobile(
                    imagePath: 'images/facebook.svg', onPress: () {});
              case 'Instagram':
                return SvgPictureButtonMobile(
                    imagePath: 'images/insta.svg', onPress: () {});
              case 'Youtube':
                return SvgPictureButtonMobile(
                    imagePath: 'images/youtube.svg', onPress: () {});
              case 'LinkedIn':
                return SvgPictureButtonMobile(
                    imagePath: 'images/in.svg', onPress: () {});
              case 'TikTok':
                return SvgPictureButtonMobile(
                    imagePath: 'images/tictok.svg', onPress: () {});
              case 'Twitter':
                return SvgPictureButtonMobile(
                    imagePath: 'images/xt.svg', onPress: () {});
              default:
                return SvgPictureButtonMobile(
                    imagePath: 'images/xt.svg', onPress: () {});
            }
          }).toList(),
        ],
      ),
    );
  }
}
