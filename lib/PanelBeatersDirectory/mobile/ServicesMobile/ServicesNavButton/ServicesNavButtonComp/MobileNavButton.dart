import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class MobileNavButton extends StatelessWidget {
  final String navIcon;
  final String navText;
  final bool isSelected;
  final VoidCallback onTap;

  const MobileNavButton({
    Key? key,
    required this.navIcon,
    required this.navText,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MyUtility(context).height * 0.03,
        decoration: ShapeDecoration(
          color: isSelected ? Color(0xFF0E1013) : Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 6, right: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isSelected,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: SvgPicture.asset(
                  navIcon,
                  width: 18,
                  height: 18,
                  color: Color(0xFFFF8728),
                ),
              ),
              SizedBox(width: 4),
              Text(
                navText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MyUtility(context).width * 0.032,
                  fontFamily: 'raleway',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
