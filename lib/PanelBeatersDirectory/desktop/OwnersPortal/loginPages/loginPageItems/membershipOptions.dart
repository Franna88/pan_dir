import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/greyTable.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/radioButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallScreenRadioButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/whiteBallpointText.dart';

enum MembershipValues {
  starterM,
  starterA,
  coreM,
  coreA,
  premiumM,
  premiumA,
  premiumPlusM,
  premiumPlusA
}

enum MembershipOnceOff { noOnceOf, onceOff }

class MembershipOptions extends StatefulWidget {
  Function changePageIndex;
  Function(String) getMemberShipType;
  MembershipOptions(
      {super.key,
      required this.changePageIndex,
      required this.getMemberShipType});

  @override
  State<MembershipOptions> createState() => _MembershipOptionsState();
}

class _MembershipOptionsState extends State<MembershipOptions> {
  MembershipValues? _radioValue = MembershipValues.starterA;
  MembershipOnceOff onceOffValue = MembershipOnceOff.onceOff;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightDevice / 30,
        ),
        NumberProgressBar(
          number1: OrangeCheckMark(),
          color1: const Color.fromARGB(199, 226, 131, 43),
          number2: OrangeCheckMark(),
          color2: const Color.fromARGB(199, 226, 131, 43),
          number3: ProgressBarNumbers(number: '03'),
          color3: const Color.fromARGB(255, 114, 113, 113),
          number4: ProgressBarNumbers(number: '04'),
          color4: const Color.fromARGB(255, 114, 113, 113),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 10 : 25,
        ),
        Text('Membership Options',
            textAlign: TextAlign.center,
            style: heightDevice < 710
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'ralewaybold',
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice < 1500 ? 30 : 40,
                    fontFamily: 'ralewaybold',
                  )),
        SizedBox(
          height: heightDevice < 710 ? 5 : 10,
        ),
        Text(
            'Choose your membership option.\nYou can change this at any time in the future.',
            textAlign: TextAlign.center,
            style: heightDevice < 710
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'raleway',
                    height: 1,
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice < 1500 ? 14 : 18,
                    fontFamily: 'raleway',
                    height: 1,
                  )),

        SizedBox(
          height: heightDevice < 710
              ? 10
              : widthDevice < 1500
                  ? 20
                  : 30,
        ),

        //ROW 1

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text('Options',
                  textAlign: TextAlign.start,
                  style: heightDevice < 710
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'raleway',
                          height: 1,
                        )
                      : TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice < 1500 ? 14 : 16,
                          fontFamily: 'raleway',
                          height: 1,
                        )),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: Text(
                'Monthly',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: Text(
                'Annual',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
          ],
        ),

        //ROW 2

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Once Off Activation Fee',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: onceOffValue,
                      onChanged: (MembershipOnceOff? value) {
                        setState(
                          () {
                            onceOffValue = value!;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipOnceOff.onceOff)
                  : RadioButton(
                      groupValue: onceOffValue,
                      onChanged: (MembershipOnceOff? value) {
                        setState(
                          () {
                            onceOffValue = value!;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipOnceOff.onceOff),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: onceOffValue,
                      onChanged: (MembershipOnceOff? value) {
                        setState(
                          () {
                            onceOffValue = value!;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipOnceOff.onceOff)
                  : RadioButton(
                      groupValue: onceOffValue,
                      onChanged: (MembershipOnceOff? value) {
                        setState(
                          () {
                            onceOffValue = value!;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipOnceOff.onceOff),
            ),
          ],
        ),

        //ROW 3
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Starter',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("StarterM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.noOnceOf;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.starterM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("StarterM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.noOnceOf;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.starterM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("StarterA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.noOnceOf;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.starterA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("StarterA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.noOnceOf;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.starterA),
            ),
          ],
        ),

        //ROW 4

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Core',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("CoreM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 99',
                      value: MembershipValues.coreM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("CoreM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 99',
                      value: MembershipValues.coreM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("CoreA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 1 188',
                      value: MembershipValues.coreA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("CoreA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 1 188',
                      value: MembershipValues.coreA),
            ),
          ],
        ),
        // ROW 5

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Premium',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("PremiumM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 434',
                      value: MembershipValues.premiumM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("PremiumM");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 434',
                      value: MembershipValues.premiumM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("PremiumA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 4 948',
                      value: MembershipValues.premiumA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("PremiumA");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 4 948',
                      value: MembershipValues.premiumA),
            ),
          ],
        ),
        //Row 6

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GreyTable(
              width: widthDevice < 1500 ? 175 : 200,
              child: Text(
                'Premium +',
                textAlign: TextAlign.start,
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        height: 1,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
              ),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("Premium+M");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 520',
                      value: MembershipValues.premiumPlusM)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("Premium+M");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 520',
                      value: MembershipValues.premiumPlusM),
            ),
            GreyTable(
              width: widthDevice < 1500 ? 115 : 130,
              child: widthDevice < 1500
                  ? SmallScreenRadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("Premium+A");
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 5 921',
                      value: MembershipValues.premiumPlusA)
                  : RadioButton(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            widget.getMemberShipType("Premium+A");
                            _radioValue = value;
                            onceOffValue = MembershipOnceOff.onceOff;
                          },
                        );
                      },
                      text: 'R 5 921',
                      value: MembershipValues.premiumPlusA),
            ),
          ],
        ),
        SizedBox(
          height: heightDevice < 710 ? 5 : 15,
        ),
        SizedBox(
          width: widthDevice < 1500 ? widthDevice * 0.30 : widthDevice * 0.24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WhiteBallpointText(ballText: 'Prices exclude VAT'),
              WhiteBallpointText(ballText: 'Single fee - No hidden extras'),
              WhiteBallpointText(
                  ballText: 'Calendar month cancellation notice'),
              WhiteBallpointText(
                  ballText:
                      'Monthly on advance via Debit Order to limit costs'),
            ],
          ),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 15 : 30,
        ),
        LongOrangeButton(
            onPressed: () {
              widget.changePageIndex();
            },
            buttonText: 'Continue'),
        SizedBox(
          height: heightDevice < 710
              ? 15
              : widthDevice < 1500
                  ? 25
                  : 35,
        ),
      ],
    );
  }
}
