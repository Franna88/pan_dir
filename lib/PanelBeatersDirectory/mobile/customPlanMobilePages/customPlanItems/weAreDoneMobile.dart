import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileNextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileWhiteContainer.dart';

class WeAreDoneMobile extends StatefulWidget {
  Function(String) nextQuestions;
  Function closeDialog;
  WeAreDoneMobile(
      {super.key, required this.nextQuestions, required this.closeDialog});

  @override
  State<WeAreDoneMobile> createState() => _WeAreDoneMobileState();
}

class _WeAreDoneMobileState extends State<WeAreDoneMobile> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MobileWhiteContainer(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MobileProgressBar(
                orangeBar: Container(
                  width: widthDevice * 0.63,
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
                  'We are done! Thanks for your time!',
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
              const SizedBox(
                height: 10,
              ),
              Text(
                'Based on your answers, we can create a customized pricing plan that includes the features that are most valuable to your shop\'s operation and growth.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'raleway',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lightbulb.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MobileNextButton(
                  buttonText: 'Please take me to my results',
                  onPressed: () {
                    widget.closeDialog();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
