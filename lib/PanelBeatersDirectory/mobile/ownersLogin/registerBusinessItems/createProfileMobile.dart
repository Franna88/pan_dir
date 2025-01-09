import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/mobileTextFields.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/numberProgressBarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/orangeCheckMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/passwordTextFieldMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/progressBarNumbersmobile.dart';

class CreateProfileMobile extends StatefulWidget {
  const CreateProfileMobile({super.key});

  @override
  State<CreateProfileMobile> createState() => _CreateProfileMobileState();
}

class _CreateProfileMobileState extends State<CreateProfileMobile> {
  bool checkboxValue = false;
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
              number2: ProgressBarNumbersMobile(number: '02'),
              color2: const Color.fromARGB(255, 114, 113, 113),
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
              'Create Profile',
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
              'Choose a strong password and username for your  account. This will allow you to access  your Owner\'s Portal later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1.2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileTextFields(
                    hintText: 'Name',
                    keyText: 'Username',
                    widthContainer: widthDevice * 0.36),
                SizedBox(
                  width: widthDevice * 0.39,
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PasswordTextFieldMobile(
                    hintText: 'Password',
                    keyText: 'Password',
                    widthContainer: widthDevice * 0.36),
                SizedBox(
                  width: widthDevice * 0.03,
                ),
                PasswordTextFieldMobile(
                    hintText: 'Password',
                    keyText: 'Confirm Password',
                    widthContainer: widthDevice * 0.36)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Your password needs to have:\n',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'raleway',
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' • At least 1 uppercase character\n • At least 1 lowercase character\n • At least 1 special character\n • At least 8 characters\n • At least 1 number',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'raleway',
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                side: BorderSide(
                  color: Colors.white,
                ),
                visualDensity: VisualDensity(vertical: -4, horizontal: -4),
                contentPadding: EdgeInsets.all(0),
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: checkboxValue,
                activeColor: Color(0xFFEF9040),
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue = !checkboxValue;
                  });
                },
                title: Text(
                  'Remember me',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 1),
                ),
              ),
            ),
            SizedBox(
              height: 30,
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
