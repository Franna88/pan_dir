import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/WebDirectories/Mobile/FooterMobile/FooterMobileComponents/FooterMobileTextButton.dart';
import 'package:webdirectories/myutility.dart';
import 'package:webdirectories/routes/routerNames.dart';

class PanFooterMobile extends StatefulWidget {
  const PanFooterMobile({super.key});

  @override
  State<PanFooterMobile> createState() => _PanFooterMobileState();
}

class _PanFooterMobileState extends State<PanFooterMobile> {
  final email = TextEditingController();

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  //width: MyUtility(context).width / 2.2,
                  height: MyUtility(context).height * 0.04,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'images/panelLogo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Pages',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ralewaysemi',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FooterMobileTextButton(
                      text: 'Home',
                      onpress: () {
                        context.goNamed(Routernames.panelbeatersHome);
                      }),
                  FooterMobileTextButton(text: 'Our Story', onpress: () {}),
                  FooterMobileTextButton(text: 'Watif', onpress: () {}),
                  FooterMobileTextButton(text: 'Articles', onpress: () {}),
                  FooterMobileTextButton(
                      text: 'Contact Us',
                      onpress: () {
                        context.goNamed(Routernames.panelbeatersContactUs);
                      }),
                  FooterMobileTextButton(text: 'Disclaimer', onpress: () {}),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MyUtility(context).height * 0.02,
          ),
          Text(
            'Subscribe to Newsletter',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'ralewaysemi',
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MyUtility(context).height * 0.01,
          ),
          SizedBox(
            width: MyUtility(context).width / 1.5,
            height: 50,
            child: TextFormField(
              maxLines: null,
              controller: email,
              style: TextStyle(
                height: 1,
                color: Color(0xFF0C0C0C).withOpacity(0.55),
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: 'Enter your email here',
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Raleway',
                  color: Colors.black,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                  child: Container(
                    //height: 25,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Color(0xE50C0C0C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Subscribe',
                        style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontFamily: 'raleway',
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Container(
              width: MyUtility(context).width - 20,
              height: 1.0,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'images/CC.svg',
                    width: 14,
                    height: 14,
                  ),
                  Text(
                    ' 2024 Copyright ',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'raleway',
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                  Text(
                    'Web Directories',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'ralewaysemi',
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'images/facebook1.png',
                      height: 37.5,
                      width: 37.5,
                    ),
                    onPressed: () {
                      _launchURL('https://www.facebook.com/WDirectories/');
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'images/Group.png',
                      height: 35,
                      width: 35,
                    ),
                    onPressed: () {
                      _launchURL(
                          'https://www.linkedin.com/company/web-directories/about/');
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'images/skill-icons_instagram.png',
                      height: 35,
                      width: 35,
                    ),
                    onPressed: () {
                      _launchURL('https://www.instagram.com/webdirectories/');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
