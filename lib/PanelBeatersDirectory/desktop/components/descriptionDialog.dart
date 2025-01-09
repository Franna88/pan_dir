import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsCancel.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

class DescriptionDialog extends StatefulWidget {
  String description;

  DescriptionDialog({
    required this.description,
    super.key,
  });

  @override
  State<DescriptionDialog> createState() => _DescriptionDialogState();
}

class _DescriptionDialogState extends State<DescriptionDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 185,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.09)),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: Color(0xFFD17226),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.09)),
              ),
            ),
            width: 280,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                CloseButton(
                  style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.description!, // Update title based on action
              style: TextStyle(
                color: Color(0xFFD17226),
                fontSize: 14.65,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopUpsButton(
                  text: 'Ok', // Update button text based on action
                  onTap: () {
                    Navigator.pop(context);
                  },
                  waiting: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
