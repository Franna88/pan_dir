import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsButton.dart';

class ConfirmDialog extends StatefulWidget {
  final String description;
  final Function onConfirm;
  final Function onCancel;
  const ConfirmDialog(
      {super.key,
      required this.description,
      required this.onConfirm,
      required this.onCancel});

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  bool isLoading = false;
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
              widget.description, // Update title based on action
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
                  waiting: isLoading,
                  text: 'Ok', // Update button text based on action
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await widget.onConfirm();
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 8),
                PopUpsButton(
                  text: 'Cancel',
                  onTap: () {
                    widget.onCancel();
                  },
                  waiting: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
