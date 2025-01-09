import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/PopUpsCancel.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

class PopUpsDeleteEntry extends StatefulWidget {
  final VoidCallback onDelete;
  const PopUpsDeleteEntry({super.key, required this.onDelete});

  @override
  State<PopUpsDeleteEntry> createState() => _PopUpsDeleteEntryState();
}

class _PopUpsDeleteEntryState extends State<PopUpsDeleteEntry> {
  List<DropdownMenuItem<String>> registrationTypeData = [];
  var formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _registrationType = TextEditingController();
  final TextEditingController _registrationNumber = TextEditingController();
  bool displayOnBusinessProfile = false;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.26,
        height: MyUtility(context).height * 0.28,
        decoration: ShapeDecoration(
          color: Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MyUtility(context).width,
              height: MyUtility(context).height * 0.06,
              decoration: ShapeDecoration(
                color: Color(0xFFE52F2F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.09),
                    topRight: Radius.circular(8.09),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      'Delete Entry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.61,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  CloseButton(
                    style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.white)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.12,
                  child: Text(
                    'Are you sure you want to delete this record?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.73,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: PopUpsCancel(
                    text: 'Delete',
                    onTap: () {
                      widget.onDelete();
                    },
                    buttonColor: Color(0xFFE52F2F),
                  ),
                ),
                PopUpsCancel(
                  text: 'Cancel',
                  onTap: () {
                    Navigator.pop(context);
                  },
                  buttonColor: Color(0xFF3C4043),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
