import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginMainPage/ownersPortal.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/ownersPortalLoginForm.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/dividers.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/longOrangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/mediumTextBox.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/passwordTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OwnersPortalLogin extends StatelessWidget {
  final Function(int) changePageIndex;
  final Function(String) updateEmail;
  OwnersPortalLogin(
      {super.key, required this.changePageIndex, required this.updateEmail});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: heightDevice < 710 ? 25 : heightDevice * 0.08,
        ),
        Text('Owners Portal Login',
            textAlign: TextAlign.center,
            style: widthDevice < 1500
                ? TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'ralewaybold',
                  )
                : TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'ralewaybold',
                  )),
        SizedBox(
          height: 10,
        ),
        OwnersPortalLoginForm(
          updateEmail: updateEmail,
          changePageIndex: changePageIndex,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Dividers(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'or',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Dividers()
          ],
        ),
        SizedBox(
          height: heightDevice < 710 ? 10 : 20,
        ),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: heightDevice < 710 ? 25 : 40,
                height: heightDevice < 710 ? 25 : 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/googleicon.png'))),
              ),
              Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: heightDevice < 710 ? 16 : 18,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  //height: 0.05,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightDevice < 710 ? 10 : 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                changePageIndex(1);
              },
              child: Text(
                'Not Registered Yet? ',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      )
                    : TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
              ),
            ),
            TextButton(
              onPressed: () {
                changePageIndex(1);
              },
              child: Text(
                'Click here',
                style: widthDevice < 1500
                    ? TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 14,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      )
                    : TextStyle(
                        color: Color(0xFFEF9040),
                        fontSize: 16,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFEF9040),
                      ),
              ),
            )
          ],
        ),
        SizedBox(
          height: heightDevice < 710 ? 15 : heightDevice * 0.05,
        ),
        const Text('v1.0.0.1b'),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
