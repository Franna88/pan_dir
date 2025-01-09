import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/mobileGreyTable.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/numberProgressBarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/orangeCheckMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/progressBarNumbersmobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/radioButtonMobile.dart';

enum MembershipValues { onceOffM, onceOffA }

class MembershipOptionsMobile extends StatefulWidget {
  const MembershipOptionsMobile({super.key});

  @override
  State<MembershipOptionsMobile> createState() =>
      _MembershipOptionsMobileState();
}

class _MembershipOptionsMobileState extends State<MembershipOptionsMobile> {
  MembershipValues? _radioValue = MembershipValues.onceOffM;
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NumberProgressBarMobile(
              number1: OrangeCheckMobile(),
              color1: const Color.fromARGB(199, 226, 131, 43),
              number2: OrangeCheckMobile(),
              color2: const Color.fromARGB(199, 226, 131, 43),
              number3: ProgressBarNumbersMobile(number: '03'),
              color3: const Color.fromARGB(255, 114, 113, 113),
              number4: ProgressBarNumbersMobile(number: '04'),
              color4: const Color.fromARGB(255, 114, 113, 113),
              number5: ProgressBarNumbersMobile(number: '05'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Membership Options',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'ralewaybold',
                  height: 1),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Choose your membership option. You can change this at any time in the future.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1.2,
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //ROW 1
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Option',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Monthly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Annual',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Row 2
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Activation Fee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R299',
                      value: MembershipValues.onceOffM),
                ),
                MobileGreyTable(
                    width: widthDevice * 0.23,
                    child: RadioButtonMobile(
                        groupValue: _radioValue,
                        onChanged: (MembershipValues? value) {
                          setState(
                            () {
                              _radioValue = value;
                            },
                          );
                        },
                        text: 'R299',
                        value: MembershipValues.onceOffA)),
              ],
            ),
            //ROW 3
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Starter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffM),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'Free',
                      value: MembershipValues.onceOffA),
                ),
              ],
            ),

            //ROW 4
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Core',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 99',
                      value: MembershipValues.onceOffM),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 1 188',
                      value: MembershipValues.onceOffA),
                ),
              ],
            ),
            //ROW 5
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Premium',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 434',
                      value: MembershipValues.onceOffM),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 4 948',
                      value: MembershipValues.onceOffA),
                ),
              ],
            ),
            //ROW 6
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileGreyTable(
                  width: widthDevice * 0.31,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 8, left: 5),
                    child: Text(
                      'Premium +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontFamily: 'raleway',
                        height: 1,
                      ),
                    ),
                  ),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 520',
                      value: MembershipValues.onceOffM),
                ),
                MobileGreyTable(
                  width: widthDevice * 0.23,
                  child: RadioButtonMobile(
                      groupValue: _radioValue,
                      onChanged: (MembershipValues? value) {
                        setState(
                          () {
                            _radioValue = value;
                          },
                        );
                      },
                      text: 'R 5 921',
                      value: MembershipValues.onceOffA),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '*Prices exclude VAT \n*Single fee - No hidden extras\n*Calendar month cancellation notice\n*Monthly on advance via Debit Order to limit costs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  height: 1.2,
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            LongOrangeMobileButton(
                onPressed: () {},
                buttonText: 'Continue',
                widthButton: widthDevice * 0.75),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
