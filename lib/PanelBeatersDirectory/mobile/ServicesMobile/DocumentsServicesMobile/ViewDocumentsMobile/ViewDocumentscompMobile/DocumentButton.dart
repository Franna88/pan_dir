import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

class DocumentButtonMobile extends StatelessWidget {
  final String documentText;
  final bool isSelected;
  final VoidCallback onPressedDownload;
  final VoidCallback onPressPreview;
  final VoidCallback onTap;

  const DocumentButtonMobile({
    Key? key,
    required this.documentText,
    required this.isSelected,
    required this.onPressedDownload,
    required this.onPressPreview,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MyUtility(context).width * 0.85,
          height: MyUtility(context).height * 0.05,
          decoration: ShapeDecoration(
            color: isSelected ? Color(0xFF0E1013) : Color(0xFF3C4043),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(37.99),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.5,
                  child: Text(
                    documentText,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8999999761581421),
                      fontSize: MyUtility(context).width * 0.037,
                      fontFamily: 'ralewaymedium',
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onPressedDownload,
                        child: Container(
                          width: 23.35,
                          height: 23.35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.download_sharp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onPressPreview,
                        child: Container(
                          width: 23.35,
                          height: 23.35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
