import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class ProfileSocialIconContact extends StatefulWidget {
  final String profileIcon;
  final String socialdescription;
  final VoidCallback onPress;
  final bool isComingSoon;

  const ProfileSocialIconContact(
      {Key? key,
      required this.profileIcon,
      required this.socialdescription,
      required this.onPress,
      this.isComingSoon = false});

  @override
  State<ProfileSocialIconContact> createState() =>
      _ProfileSocialIconContactState();
}

class _ProfileSocialIconContactState extends State<ProfileSocialIconContact> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // cursor: SystemMouseCursors.click,
      cursor: widget.isComingSoon
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,

      onEnter: (_) {
        if (widget.isComingSoon) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                GestureDetector(
                  onTap: widget.onPress,
                  child: Container(
                    width: MyUtility(context).width * 0.05,
                    height: MyUtility(context).height * 0.085,
                    child: SvgPicture.asset(widget.profileIcon),
                  ),
                ),
                SizedBox(
                  height: MyUtility(context).height * 0.04,
                  child: Text(
                    widget.socialdescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.6,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          if (isHovered && widget.isComingSoon)
            Positioned(
              top: 0,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'raleway',
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
