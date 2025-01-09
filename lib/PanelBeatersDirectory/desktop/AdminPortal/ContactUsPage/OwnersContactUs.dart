import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/emails/contactUs/sendContactUs.dart';
import 'package:webdirectories/myutility.dart';

import '../../components/descriptionDialog.dart';
import '../Dashboard/DashboardContainers/DashProfileView.dart';

class OwnersContactUs extends StatefulWidget {
  Function getListingId;
  OwnersContactUs({
    super.key,
    required this.getListingId,
  });

  @override
  State<OwnersContactUs> createState() => _OwnersContactUsState();
}

class _OwnersContactUsState extends State<OwnersContactUs> {
  final _textController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;

  Future descriptionDialog(description) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: DescriptionDialog(
          description: description,
        ));
      });

  sendEmail() async {
    if (_textController.text == "") {
      return descriptionDialog("No data to send");
    }
    var userId = await widget.getListingId();

    QuerySnapshot userDoc = await _firestore
        .collection('listings')
        .where('listingsId', isEqualTo: userId)
        .get();

    if (userDoc.docs.isNotEmpty) {
      await sendContactUsEmail(
          message: _textController.text,
          email: userDoc.docs[0]['businessEmail'],
          name: userDoc.docs[0]['title']);
      await descriptionDialog("Thank you ,your email has been sent.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width * 0.8,
              height: MyUtility(context).height * 0.85,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.27, -0.62),
                  end: Alignment(0.27, 0.82),
                  colors: [
                    Color(0x19777777),
                    Colors.white.withOpacity(0.4000000059604645)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xBF000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Manage your Panel Beater Directory Membership',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.60,
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Our dedicated support team is happy to assist you. Please leave a comment below and we will get back to you A.S.A.P. Alternatively can reach us by email ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'admin@webdirectories.co.za',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 14.73,
                                fontFamily: 'ralewaymedium',
                              ),
                            ),
                            TextSpan(
                              text: ' or phone ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: '012 403 0120',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontSize: 14.73,
                                fontFamily: 'ralewaymedium',
                              ),
                            ),
                            TextSpan(
                              text: '.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.73,
                                fontFamily: 'raleway',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Comment:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.73,
                          fontFamily: 'raleway',
                        ),
                      ),
                    ),
                    TextField(
                      controller: _textController,
                      maxLines: 10,
                      minLines: 4,
                      decoration: InputDecoration(
                        hintText: "",
                        hintStyle: TextStyle(
                            color: Colors
                                .black), // Change the hint text color if needed
                        filled: true,
                        fillColor: Colors
                            .white, // Set the background color of the TextField to white
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .transparent), // Make the border transparent
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .transparent), // Make the border transparent
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .transparent), // Make the border transparent
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0),
                      ),
                      style: TextStyle(
                          color: Colors
                              .black), // Set the input text color to black or another color for contrast
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddButton(
                            text: 'Submit',
                            onPressed: () {
                              sendEmail();
                            }),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
