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

class AdvancedFeatures extends StatefulWidget {
  CustomPlanItems customItems;
  Function closeDialog;
  Function(String) updateIndex;
  AdvancedFeatures(
      {super.key,
      required this.closeDialog,
      required this.updateIndex,
      required this.customItems});

  @override
  State<AdvancedFeatures> createState() => _ClientCommunicationState();
}

class _ClientCommunicationState extends State<AdvancedFeatures> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SizedBox(
      //  height: heightDevice * 0.75,
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
                  width: 74.2 * 5,
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
                  'Advanced Features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35,
                      fontFamily: 'ralewaybold',
                      height: 1),
                ),
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
                      widget.customItems.items[13].question,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'raleway',
                          height: 1.1),
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
                                      .customItems.items[13].answer
                                      .contains('Yes'),
                                  description: 'Yes',
                                  onChanged: widget
                                      .customItems.items[13].updateAnswer),
                              CheckBoxStyle(
                                  checkboxValue: widget
                                      .customItems.items[13].answer
                                      .contains('No'),
                                  description: 'No',
                                  onChanged:
                                      widget.customItems.items[13].updateAnswer)
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
                          widget.customItems.items[14].question,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'raleway',
                              height: 1.1),
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
                                          .customItems.items[14].answer
                                          .contains('Yes'),
                                      description: 'Yes',
                                      onChanged: widget
                                          .customItems.items[14].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[14].answer
                                          .contains('No'),
                                      description: 'No',
                                      onChanged: widget
                                          .customItems.items[14].updateAnswer)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.customItems.items[15].question,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'raleway',
                              height: 1.1),
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
                                          .customItems.items[15].answer
                                          .contains('Yes'),
                                      description: 'Yes',
                                      onChanged: widget
                                          .customItems.items[15].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[15].answer
                                          .contains('No'),
                                      description: 'No',
                                      onChanged: widget
                                          .customItems.items[15].updateAnswer)
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.customItems.items[16].question,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'raleway',
                              height: 1.1),
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
                                          .customItems.items[16].answer
                                          .contains('Yes'),
                                      description: 'Yes',
                                      onChanged: widget
                                          .customItems.items[16].updateAnswer),
                                  CheckBoxStyle(
                                      checkboxValue: widget
                                          .customItems.items[16].answer
                                          .contains('No'),
                                      description: 'No',
                                      onChanged: widget
                                          .customItems.items[16].updateAnswer)
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
                padding: const EdgeInsets.only(bottom: 5, left: 10),
                child: Row(
                  children: [
                    GoBackButton(
                      onGoBack: () => widget.updateIndex("-"),
                    ),
                    Spacer(),
                    NextButton(
                      onPressed: () {
                        if (widget.customItems.items[13].answer.isEmpty ||
                            widget.customItems.items[14].answer.isEmpty ||
                            widget.customItems.items[15].answer.isEmpty ||
                            widget.customItems.items[16].answer.isEmpty) {
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
