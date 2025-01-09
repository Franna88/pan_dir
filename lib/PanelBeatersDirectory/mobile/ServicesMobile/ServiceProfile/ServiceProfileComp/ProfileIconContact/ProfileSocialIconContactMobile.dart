import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class ProfileSocialIconContactMobile extends StatefulWidget {
  final String profileIcon;
  final String socialdescription;
  final VoidCallback onPress;

  const ProfileSocialIconContactMobile(
      {Key? key,
      required this.profileIcon,
      required this.socialdescription,
      required this.onPress});

  @override
  State<ProfileSocialIconContactMobile> createState() =>
      _ProfileSocialIconContactMobileState();
}

class _ProfileSocialIconContactMobileState
    extends State<ProfileSocialIconContactMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onPress,
            child: Container(
              width: MyUtility(context).width * 0.11,
              height: MyUtility(context).height * 0.07,
              child: SvgPicture.asset(widget.profileIcon),
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.05,
            child: Text(
              widget.socialdescription,
              style: TextStyle(
                color: Colors.white,
                fontSize: MyUtility(context).width * 0.035,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
