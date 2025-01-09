import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class GetinTouchMobile extends StatefulWidget {
  const GetinTouchMobile({super.key});

  @override
  State<GetinTouchMobile> createState() => _GetinTouchMobileState();
}

class _GetinTouchMobileState extends State<GetinTouchMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: TextStyle(
              fontSize: 46,
              fontFamily: 'ralewaysemi',
              color: Color(0xFF0E1013)),
          textAlign: TextAlign.left,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: Container(
            width: 95,
            height: 1,
            decoration: BoxDecoration(color: Color(0xFFD6D6D6)),
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.2,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text:
                      "Have questions about our directories or your profile? We're here to help! Reach out to our team via email at ",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: "info@webdirectories.co.za",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewaysemi',
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text:
                      " or fill out the contact form. We look forward to connecting with you!",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: 125,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/buisnesshours.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.01,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Business Hours",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Mon-Fri | 08:00AM – 5:00PM\nSat-Sun & Public Holidays |\nClosed",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: 125,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/contactus.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.015,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "(+27) 12 403 1020\ninfo@webdirectories.co.za",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: MyUtility(context).width / 1.2,
          height: 125,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/address.svg')),
              SizedBox(
                width: MyUtility(context).width * 0.015,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ralewaysemi',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Open Google Maps",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
