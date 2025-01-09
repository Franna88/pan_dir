import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/greyButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';

class LetsFindYourCustomPlan extends StatefulWidget {
  Function closeDialog;
  Function(String) updateIndex;
  LetsFindYourCustomPlan(
      {super.key, required this.closeDialog, required this.updateIndex});

  @override
  State<LetsFindYourCustomPlan> createState() => _LetsFindYourCustomPlanState();
}

class _LetsFindYourCustomPlanState extends State<LetsFindYourCustomPlan> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      //  height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClosePageButton(
                closeDialog: widget.closeDialog,
              ),
              Text(
                'Let’s find your \nplan!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontFamily: 'ralewaybold',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lightbulb.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                'We understand that every panel beating business is unique \nand we want to help you find the perfect plan for your needs,\nTo do that, we need to ask you a few quick questions.\nAre you ready?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'raleway',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        isHovered = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        isHovered = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      /*width: MediaQuery.of(context).size.width * 0.08,*/
                      /*height: MediaQuery.of(context).size.height * 0.05,*/
                      child: ElevatedButton(
                        onPressed: () {
                          //ADD LOGIC HERE
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isHovered ? Colors.black : Color(0xFFE2822B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.updateIndex("+");
                                },
                                child: Text(
                                  'Yes, lets do it!',
                                  style: TextStyle(
                                    color:
                                        isHovered ? Colors.white : Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'ralewaymedium',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                      onTap: () {
                        widget.closeDialog();
                      },
                      child:
                          GreyButton(buttonText: 'No, skip to pricing plans'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I am already a member, I want to upgrade.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'raleway',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //ADD LOGIC HERE
                    },
                    child: Text(
                      'Click here',
                      style: TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 20,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
