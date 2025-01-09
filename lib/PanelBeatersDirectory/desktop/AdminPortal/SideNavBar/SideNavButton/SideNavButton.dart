import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class SideNavButton extends StatelessWidget {
  final String icon;
  final String selectedIcon; // New field for selected icon
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  SideNavButton({
    required this.icon,
    required this.selectedIcon, // Add selectedIcon to constructor
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          color: isSelected ? Color(0xFFFF7B16) : Colors.transparent,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.009,
                      ),
                      SizedBox(
                        width: MyUtility(context).width * 0.018,
                        height: MyUtility(context).height * 0.019,
                        child: SvgPicture.asset(
                          isSelected
                              ? selectedIcon
                              : icon, // Change icon based on isSelected
                          width: widthDevice < 1500 ? 18 : 24,
                          height: widthDevice < 1500 ? 18 : 24,
                          color: Colors.white, // Keep color consistent
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.64,
                          fontFamily: 'raleway',
                          fontWeight: FontWeight.w400,
                          height: 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
