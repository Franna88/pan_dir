import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/loginPageItems/membershipOptions.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/OwnersPortal/loginPages/ui/glassContainer.dart';

class LoginLandingPage extends StatelessWidget {
  const LoginLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/effortlessManagement.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Image.asset(
                'images/panelLogo.png',
                width: 225,
                height: 110,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightDevice / 1.3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Effortless \nManagement',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: widthDevice / 20,
                              fontFamily: 'ralewaybold',
                              height: 1),
                        ),
                        Text(
                          '\nMore time for repairs, less time on admin. Customize and \nmanage your online profile anytime, anywhere!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice / 80,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: widthDevice * 0.10),
                Column(
                  children: [
                    //SizedBox(width: heightDevice / 5),
                    /*   GlassContainer(
                        child: MembershipOptions(changePageIndex: () {})
                        //MembershipOptions()
                        ),*/
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
