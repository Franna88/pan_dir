import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/customPlanMobilePages/ui/mobileWhiteContainer.dart';

class LetsFindYourPlanMobile extends StatefulWidget {
  Function(String) nextQuestions;
  Function closeDialog;
  LetsFindYourPlanMobile(
      {super.key, required this.nextQuestions, required this.closeDialog});

  @override
  State<LetsFindYourPlanMobile> createState() => _LetsFindYourPlanMobileState();
}

class _LetsFindYourPlanMobileState extends State<LetsFindYourPlanMobile> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MobileWhiteContainer(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClosePageButton(
                closeDialog: () {
                  widget.closeDialog();
                },
              ),
              Text(
                'Let’s find your custom plan!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'ralewaybold',
                    height: 1),
              ),
              const SizedBox(
                height: 10,
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
              Text(
                'We understand that every panel beating business is unique and we want to help you find the perfect plan for your needs, To do that, we need to ask you a few quick questions. Are you ready?',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'raleway',
                    height: 1.2),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isPressed = !isPressed;
                      widget.nextQuestions("+");
                    });
                    //ADD LOGIC HERE
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isPressed ? Colors.black : Color(0xFFE2822B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Yes, lets do it!',
                          style: TextStyle(
                            color: isPressed ? Colors.white : Colors.black,
                            fontSize: 14,
                            fontFamily: 'ralewaymedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: ShapeDecoration(
                  color: Color(0xFF5B5B5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(230),
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
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 92, 92, 92),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'No, skip to pricing plans',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'ralewaymedium',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'I am already a member, I want to upgrade. ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'raleway',
                            ),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer(),
                            //ADD LOGIC TO RECOGNIZER
                            text: 'Click here',
                            style: TextStyle(
                              color: Color(0xFFEF9040),
                              fontSize: 16,
                              fontFamily: 'raleway',
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFFEF9040),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
