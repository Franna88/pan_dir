import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/AttachmentPopupButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/ResizeableTextField.dart';
import 'package:webdirectories/myutility.dart';

class JobRequestPopup extends StatefulWidget {
  const JobRequestPopup({super.key});

  @override
  State<JobRequestPopup> createState() => _JobRequestPopupState();
}

class _JobRequestPopupState extends State<JobRequestPopup> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MyUtility(context).width * 0.63,
        height: MyUtility(context).height * 0.6,
        decoration: ShapeDecoration(
          color: Color(0xFF0F253A),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFFEF9040),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Willem Harmse - Job Request',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21.76,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    CloseButton(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResizzeableTextField(
                    text: 'Date Published',
                    textFieldWidth: 0.16,
                  ),
                  ResizzeableTextField(
                    text: 'Occupation',
                    textFieldWidth: 0.16,
                  ),
                  ResizzeableTextField(
                    text: 'Qualifications',
                    textFieldWidth: 0.25,
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.01,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResizzeableTextField(
                    text: 'Years Experience',
                    textFieldWidth: 0.16,
                  ),
                  ResizzeableTextField(
                    text: 'Area / s Looking for Work:',
                    textFieldWidth: 0.422,
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.01,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResizzeableTextField(
                    text: 'Name & Surname',
                    textFieldWidth: 0.19,
                  ),
                  ResizzeableTextField(
                    text: 'Contact Number',
                    textFieldWidth: 0.19,
                  ),
                  ResizzeableTextField(
                    text: 'Email',
                    textFieldWidth: 0.19,
                  ),
                  SizedBox(
                    width: MyUtility(context).width * 0.01,
                  )
                ],
              ),
              AttachmentPopupButton(text: 'Download CV', onTap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
