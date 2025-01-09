import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class MediaLinkContainer extends StatelessWidget {
  final String mediaType;
  final String mediaLink;
  final VoidCallback pressEdit;
  final VoidCallback pressDelete;
  final bool isEven;

  const MediaLinkContainer({
    super.key,
    required this.mediaType,
    required this.mediaLink,
    required this.pressDelete,
    required this.pressEdit,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isEven ? Color(0xFF0E1013) : Color(0x7F292E31),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      alignment: Alignment.centerLeft,
      height: MyUtility(context).height * 0.065,
      child: Row(
        children: [
          // Media Type
          Expanded(
            flex: 2,
            child: Text(
              mediaType,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Media Link
          Expanded(
            flex: 3,
            child: Text(
              mediaLink,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.64,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // Vertical Divider
          Container(
            width: 0.5,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          // Edit Button
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: pressEdit,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: pressDelete,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
