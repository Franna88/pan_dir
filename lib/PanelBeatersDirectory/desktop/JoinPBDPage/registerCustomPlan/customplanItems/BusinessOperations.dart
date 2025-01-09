import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/customplanItems/customPlanItems.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/checkBoxStyle.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/closePageButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/goBackButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/nextButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/progressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/JoinPBDPage/registerCustomPlan/ui/whiteContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/descriptionDialog.dart';

class BusinessOperations extends StatefulWidget {
  CustomPlanItems customItems;
  Function closeDialog;
  Function(String) updateIndex;
  BusinessOperations(
      {super.key,
      required this.closeDialog,
      required this.updateIndex,
      required this.customItems});

  @override
  State<BusinessOperations> createState() => _ClientCommunicationState();
}

class _ClientCommunicationState extends State<BusinessOperations> {
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
                  width: 74.2 * 3,
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
                height: 15,
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
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.customItems.items[6].question,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'raleway',
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              CheckBoxStyle(
                                  checkboxValue: widget
                                      .customItems.items[6].answer
                                      .contains('Yes'),
                                  description: 'Yes',
                                  onChanged:
                                      widget.customItems.items[6].updateAnswer),
                              CheckBoxStyle(
                                  checkboxValue: widget
                                      .customItems.items[6].answer
                                      .contains('No'),
                                  description: 'No',
                                  onChanged:
                                      widget.customItems.items[6].updateAnswer)
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.customItems.items[7].question,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[7].answer
                                          .contains('Yes'),
                                      description: 'Yes',
                                      onChanged: widget
                                          .customItems.items[7].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[7].answer
                                          .contains('No'),
                                      description: 'No',
                                      onChanged: widget
                                          .customItems.items[7].updateAnswer)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.customItems.items[8].question,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            SizedBox(
                              width: 200,
                              child: Column(
                                children: [
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[8].answer
                                          .contains('SAMBRA'),
                                      description: 'SAMBRA',
                                      onChanged: widget
                                          .customItems.items[8].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[8].answer
                                          .contains('CRA'),
                                      description: 'CRA',
                                      onChanged: widget
                                          .customItems.items[8].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[8].answer
                                          .contains('SAARSA'),
                                      description: 'SAARSA',
                                      onChanged: widget
                                          .customItems.items[8].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[8].answer
                                          .contains('Lightstone EchoMBR'),
                                      description: 'Lightstone EchoMBR',
                                      onChanged: widget
                                          .customItems.items[8].updateAnswer)
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 10),
                child: Row(
                  children: [
                    GoBackButton(
                      onGoBack: () => widget.updateIndex("-"),
                    ),
                    Spacer(),
                    NextButton(
                      onPressed: () {
                        if (widget.customItems.items[6].answer.isEmpty ||
                            widget.customItems.items[7].answer.isEmpty ||
                            widget.customItems.items[8].answer.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: DescriptionDialog(
                                    description: 'Please answer all questions',
                                  ),
                                );
                              });
                          return;
                        }
                        widget.updateIndex("+");
                      },
                      buttonText: 'Next',
                    )
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
