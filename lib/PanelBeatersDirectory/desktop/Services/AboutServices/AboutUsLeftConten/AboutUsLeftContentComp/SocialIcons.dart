import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutUsLeftConten/AboutUsLeftContentComp/SvgPictureButton.dart';
import 'package:webdirectories/myutility.dart';

class SocialIcons extends StatefulWidget {
  final List<Map<String, dynamic>> socialIconsList;
  const SocialIcons({super.key, required this.socialIconsList});

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.28,
      height: MyUtility(context).height * 0.12,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...widget.socialIconsList.map((e) {
            switch (e['linkTitle']) {
              case 'Facebook':
                return SvgPictureButton(
                    imagePath: 'images/facebook.svg', onPress: () {});
              case 'Instagram':
                return SvgPictureButton(
                    imagePath: 'images/insta.svg', onPress: () {});
              case 'Youtube':
                return SvgPictureButton(
                    imagePath: 'images/youtube.svg', onPress: () {});
              case 'LinkedIn':
                return SvgPictureButton(
                    imagePath: 'images/in.svg', onPress: () {});
              case 'TikTok':
                return SvgPictureButton(
                    imagePath: 'images/tictok.svg', onPress: () {});
              case 'Twitter':
                return SvgPictureButton(
                    imagePath: 'images/xt.svg', onPress: () {});
              default:
                return SvgPictureButton(
                    imagePath: 'images/xt.svg', onPress: () {});
            }
          }).toList(),
        ],
      ),
    );
  }
}
