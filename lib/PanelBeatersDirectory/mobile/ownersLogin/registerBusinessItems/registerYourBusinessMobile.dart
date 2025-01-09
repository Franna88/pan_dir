import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/longOrangeMobileButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/mobileTextFields.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/numberProgressBarMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ownersLogin/ui/progressBarNumbersmobile.dart';

class RegisterYourBusinessMobile extends StatefulWidget {
  const RegisterYourBusinessMobile({super.key});

  @override
  State<RegisterYourBusinessMobile> createState() =>
      _RegisterYourBusinessMobileState();
}

class _RegisterYourBusinessMobileState
    extends State<RegisterYourBusinessMobile> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NumberProgressBarMobile(
              number1: ProgressBarNumbersMobile(number: '01'),
              color1: const Color.fromARGB(255, 114, 113, 113),
              number2: ProgressBarNumbersMobile(number: '02'),
              color2: const Color.fromARGB(255, 114, 113, 113),
              number3: ProgressBarNumbersMobile(number: '03'),
              color3: const Color.fromARGB(255, 114, 113, 113),
              number4: ProgressBarNumbersMobile(number: '04'),
              color4: const Color.fromARGB(255, 114, 113, 113),
              number5: ProgressBarNumbersMobile(number: '05'),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Register your Business!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: 'ralewaybold',
                height: 1,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Join the Panel beater Directory to connect with new customers and showcase your expertise to drivers in need.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'raleway',
                      height: 1,
                    ),
                  ),
                  TextSpan(
                    text: 'Log in',
                    //ADD BUTTON FUNCTIONALITY
                    style: TextStyle(
                      color: Color(0xFFEF9040),
                      fontSize: 16,
                      fontFamily: 'raleway',
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFEF9040),
                      height: 1,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileTextFields(
                    hintText: 'Name',
                    keyText: 'First Name',
                    widthContainer: widthDevice * 0.36),
                SizedBox(
                  width: widthDevice * 0.04,
                ),
                MobileTextFields(
                    hintText: 'Surname',
                    keyText: 'Last Name',
                    widthContainer: widthDevice * 0.36)
              ],
            ),
            MobileTextFields(
                hintText: 'Business Name',
                keyText: 'Business Trading Name',
                widthContainer: widthDevice * 0.75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MobileTextFields(
                    hintText: 'Phone',
                    keyText: 'Cell',
                    widthContainer: widthDevice * 0.36),
                SizedBox(
                  width: widthDevice * 0.04,
                ),
                MobileTextFields(
                    hintText: 'Email',
                    keyText: 'Email',
                    widthContainer: widthDevice * 0.36),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
              child: SizedBox(
                height: 55,
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
                  title: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'By creating an account, you agree to our ',
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 16,
                            fontFamily: 'raleway',
                            height: 1.2,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: Color(0xFFEF9040),
                            fontSize: 16,
                            fontFamily: 'raleway',
                            decorationColor: Color(0xFFEF9040),
                            decoration: TextDecoration.underline,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            LongOrangeMobileButton(
                onPressed: () {},
                buttonText: 'Start Sign Up Process',
                widthButton: widthDevice * 0.75)
          ],
        ),
      ),
    );
  }
}
