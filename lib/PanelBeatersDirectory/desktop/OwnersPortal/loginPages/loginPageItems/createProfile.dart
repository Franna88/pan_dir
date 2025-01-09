import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/numberProgressBar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/orangeCheckMark.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/progressBarNumbers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallCheckBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/smallTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/whiteBallpointText.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class CreateProfile extends StatefulWidget {
  Function changePageIndex;
  TextEditingController email;
  TextEditingController password;
  CreateProfile(
      {super.key,
      required this.changePageIndex,
      required this.email,
      required this.password});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController passwordStatus = TextEditingController();

  checkPasswordValidation() {
    print(widget.password.text);
    setState(() {
      if (widget.password.text == "" || widget.password.text.isEmpty) {
        passwordStatus.text = "Password is required";
        print("Password is required");
      } else if (widget.password.text!.length < 8) {
        passwordStatus.text = "Password must be at least 8 characters long";
      } else if (!widget.password.text.contains(RegExp(r'[A-Z]'))) {
        passwordStatus.text =
            "Password must contain at least one uppercase letter";
      } else if (!widget.password.text.contains(RegExp(r'[a-z]'))) {
        passwordStatus.text =
            "Password must contain at least one lowercase letter";
      } else if (!widget.password.text.contains(RegExp(r'[0-9]'))) {
        passwordStatus.text =
            "Password must contain at least one numeric character";
      } else if (!widget.password.text
          .contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
        passwordStatus.text =
            "Password must contain at least one special character";
      } else if (widget.password.text != confirmPassword.text) {
        passwordStatus.text = "Passwords do not match";
      } else {
        passwordStatus.text = "";
      }

      // passwordStatus.text = "";
    });
    if (passwordStatus.text == "") {
      widget.changePageIndex();
    }
  }

  checkPasswordConfirm() {}

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
          color1: Color.fromARGB(199, 226, 131, 43),
          number2: ProgressBarNumbers(number: '02'),
          color2: const Color.fromARGB(255, 114, 113, 113),
          number3: ProgressBarNumbers(number: '03'),
          color3: const Color.fromARGB(255, 114, 113, 113),
          number4: ProgressBarNumbers(number: '04'),
          color4: const Color.fromARGB(255, 114, 113, 113),
          number5: ProgressBarNumbers(number: '05'),
        ),
        SizedBox(
          height: heightDevice < 710 ? 5 : 10,
        ),
        Text('Create Profile',
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
          height: widthDevice < 1500 ? 10 : 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
              'Choose a strong password and username for your account. This will allow you to access your Owner\'s Portal later.',
              textAlign: TextAlign.center,
              style: heightDevice < 710
                  ? TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 13 : 15,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )
                  : TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 15 : 19,
                      fontFamily: 'raleway',
                      height: 1.3,
                    )),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 10 : 15,
        ),
        Center(
          child: SizedBox(
            width: MyUtility(context).width * 0.3,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmallTextBox(
                      hintText: 'Name',
                      keyText: 'Username',
                      textController: widget.email,
                    ),
                    SizedBox(
                      width: widthDevice < 1500 ? 200 : 230,
                    )
                  ],
                ),
                SizedBox(
                  height: widthDevice < 1500 ? 10 : 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PasswordField(
                        hintText: 'Password',
                        keyText: 'Password',
                        controller: widget.password,
                        widthContainer:
                            widthDevice < 1500 ? widthDevice * 0.14 : 215),
                    SizedBox(
                      width: 20,
                    ),
                    PasswordField(
                        hintText: 'Password',
                        keyText: 'Confirm Password',
                        controller: confirmPassword,
                        widthContainer:
                            widthDevice < 1500 ? widthDevice * 0.14 : 215),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: passwordStatus.text != "",
          child: Text(passwordStatus.text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 36, 20),
                fontSize: widthDevice < 1500 ? 14 : 18,
                fontFamily: 'raleway',
                height: 1,
              )),
        ),
        SizedBox(
          height: widthDevice < 1500 ? 15 : 25,
        ),
        SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your password needs to have:',
                  textAlign: TextAlign.center,
                  style: heightDevice < 710
                      ? TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice < 1500 ? 12 : 15,
                          fontFamily: 'raleway',
                          height: 1,
                        )
                      : TextStyle(
                          color: Colors.white,
                          fontSize: widthDevice < 1500 ? 14 : 18,
                          fontFamily: 'raleway',
                          height: 1,
                        )),
              WhiteBallpointText(ballText: 'At least 1 uppercase character'),
              WhiteBallpointText(ballText: 'At least 1 lowercase character'),
              WhiteBallpointText(ballText: 'At least 1 special character'),
              WhiteBallpointText(ballText: 'At least 8 characters'),
              WhiteBallpointText(ballText: 'At least 1 number'),
            ],
          ),
        ),
        SizedBox(
          height: heightDevice < 710 ? 5 : 10,
        ),
        SizedBox(
            width: MyUtility(context).width * 0.3,
            child: SmallCheckBox(
                description: 'Remember me', checkboxValue: false)),
        SizedBox(
          height: widthDevice < 1500 ? 15 : 25,
        ),
        LongOrangeButton(
            onPressed: () {
              setState(() {
                checkPasswordValidation();
              });

              /*    if (passwordStatus == "") {
                widget.changePageIndex();
              }*/
            },
            buttonText: "Continue"),
        SizedBox(
          height: heightDevice < 710 ? 10 : heightDevice / 30,
        ),
      ],
    );
  }
}
