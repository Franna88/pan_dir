import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/goBackButtonMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileNextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileWhiteContainer.dart';

class BusinessOperationsMobile extends StatefulWidget {
  Function(String) nextQuestions;
  Function closeDialog;
  BusinessOperationsMobile(
      {super.key, required this.nextQuestions, required this.closeDialog});

  @override
  State<BusinessOperationsMobile> createState() =>
      _BusinessOperationsMobileState();
}

class _BusinessOperationsMobileState extends State<BusinessOperationsMobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MobileWhiteContainer(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MobileProgressBar(
                orangeBar: Container(
                  width: widthDevice * 0.35,
                  height: 5,
                  decoration: ShapeDecoration(
                    color: Color(0xFFEF9040),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(72.36),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Business Operations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'ralewaybold',
                      height: 1),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Please select all that apply',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.699999988079071),
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Would having your services, OEM accreditations, insurance panels and staff information readily available online be beneficial?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'raleway',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 180,
                child: Column(
                  children: [
                    MobileCheckBox(checkboxValue: false, description: 'Yes'),
                    MobileCheckBox(description: 'No', checkboxValue: false),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Does your customers have access to your updated business hours and other essential information?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'raleway',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 180,
                child: Column(
                  children: [
                    MobileCheckBox(checkboxValue: false, description: 'Yes'),
                    MobileCheckBox(checkboxValue: false, description: 'No')
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Are you a member of:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'raleway',
                  ),
                ),
              ),
              SizedBox(
                width: 180,
                child: Column(
                  children: [
                    MobileCheckBox(checkboxValue: false, description: 'SAMBRA'),
                    MobileCheckBox(checkboxValue: false, description: 'CRA'),
                    MobileCheckBox(checkboxValue: false, description: 'SAARSA'),
                    MobileCheckBox(
                        checkboxValue: false,
                        description: 'Lightstone EchoMbr'),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GoBackButtonMobile(
                        buttonText: 'Go Back',
                        onPressed: () {
                          widget.nextQuestions("-");
                        }),
                    MobileNextButton(
                        onPressed: () {
                          widget.nextQuestions("+");
                        },
                        buttonText: 'Next')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
