import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class ContactColumnMobile extends StatefulWidget {
  const ContactColumnMobile({super.key});

  @override
  State<ContactColumnMobile> createState() => _ContactColumnMobileState();
}

class _ContactColumnMobileState extends State<ContactColumnMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20,),
        Text(
          'Need some help?',
          style: TextStyle(
            color: Color(0xFFF19A41),
            fontSize: 20,
            fontFamily: 'raleway',
           
            
          ),
        ),
        Text(
          'Get in touch',
          style: TextStyle(
              fontSize: 46, fontFamily: 'ralewaysemi', color: Colors.white),
          textAlign: TextAlign.left,
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
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: "info@webdirectories.co.za",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'ralewaysemi',
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text:
                      " or fill out the contact form. We look forward to connecting with you!",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'raleway',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          width: MyUtility(context).width / 1.2,
          //height: 110,
          //color: Colors.amber,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/panHours.svg')),
              SizedBox(
                width: 15,
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Mon-Fri | 08:00AM – 5:00PM\nSat-Sun & Public Holidays |\nClosed",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          width: MyUtility(context).width / 1.2,
          //height: 110,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/panContactUs.svg')),
             SizedBox(
                width: 15,
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "(+27) 12 403 1020\ninfo@webdirectories.co.za",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 30,),
        Container(
          //color: Colors.amber,
          width: MyUtility(context).width / 1.2,
          //height: 80,
          child: Row(
            children: [
              SizedBox(
                  width: 60,
                  height: 60,
                  child: SvgPicture.asset('images/panLocation.svg')),
              SizedBox(
                width: 15,
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
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Open Google Maps",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
  }
}
