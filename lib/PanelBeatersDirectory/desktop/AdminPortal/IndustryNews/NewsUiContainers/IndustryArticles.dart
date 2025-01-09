import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class IndustryArticles extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;
  final bool alignLeft;

  const IndustryArticles({
    Key? key,
    required this.imagePath,
    required this.onPressed,
    this.alignLeft = false, // Default to align right
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.48,
      height: MyUtility(context).height * 0.3,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.02),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: alignLeft ? 10 : null,
            right: alignLeft ? null : 10,
            child: AddButton(
              text: 'Read More',
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
