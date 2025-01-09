import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/customPlanItems.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/checkBoxStyle.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/progressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';

class ClientCommunication extends StatefulWidget {
  CustomPlanItems customItems;
  Function closeDialog;
  Function(String) updateIndex;
  ClientCommunication(
      {super.key,
      required this.closeDialog,
      required this.updateIndex,
      required this.customItems});

  @override
  State<ClientCommunication> createState() => _ClientCommunicationState();
}

class _ClientCommunicationState extends State<ClientCommunication> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      //height: heightDevice * 0.75,
      child: WhiteContainer(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 40, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClosePageButton(
                closeDialog: widget.closeDialog,
              ),
              ProgressBar(
                orangeBar: Container(
                  width: 74.2,
                  height: 12,
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
                  'Client communication &\ninformation',
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
                widget.customItems.items[0].question,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        CheckBoxStyle(
                            checkboxValue: widget.customItems.items[0].answer
                                .contains('Phone Call'),
                            description: 'Phone Call',
                            onChanged:
                                widget.customItems.items[0].updateAnswer),
                        CheckBoxStyle(
                            description: 'Email',
                            checkboxValue: widget.customItems.items[0].answer
                                .contains('Email'),
                            onChanged:
                                widget.customItems.items[0].updateAnswer),
                        CheckBoxStyle(
                            description: 'SMS',
                            checkboxValue: widget.customItems.items[0].answer
                                .contains('SMS'),
                            onChanged:
                                widget.customItems.items[0].updateAnswer),
                        CheckBoxStyle(
                            description: 'Online contact form',
                            checkboxValue: widget.customItems.items[0].answer
                                .contains('Online contact form'),
                            onChanged:
                                widget.customItems.items[0].updateAnswer),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.customItems.items[1].question,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        CheckBoxStyle(
                            checkboxValue: widget.customItems.items[1].answer
                                .contains('Yes'),
                            description: 'Yes',
                            onChanged:
                                widget.customItems.items[1].updateAnswer),
                        CheckBoxStyle(
                            checkboxValue: widget.customItems.items[1].answer
                                .contains('No'),
                            description: 'No',
                            onChanged: widget.customItems.items[1].updateAnswer)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.customItems.items[2].question,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'raleway',
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        CheckBoxStyle(
                            checkboxValue: widget.customItems.items[2].answer
                                .contains('Yes'),
                            description: 'Yes',
                            onChanged:
                                widget.customItems.items[2].updateAnswer),
                        CheckBoxStyle(
                            checkboxValue: widget.customItems.items[2].answer
                                .contains('No'),
                            description: 'No',
                            onChanged: widget.customItems.items[2].updateAnswer)
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    NextButton(
                        onPressed: () {
                          if (widget.customItems.items[0].answer.isEmpty ||
                              widget.customItems.items[1].answer.isEmpty ||
                              widget.customItems.items[2].answer.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: DescriptionDialog(
                                      description:
                                          'Please answer all questions',
                                    ),
                                  );
                                });
                            return;
                          }
                          widget.updateIndex("+");
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
