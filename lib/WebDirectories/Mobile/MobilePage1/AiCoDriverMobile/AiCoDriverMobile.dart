import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage3/MobilePage3.dart';
import 'package:webdirectories/myutility.dart';

class AiCoDriverMobile extends StatefulWidget {
  const AiCoDriverMobile({super.key});

  @override
  State<AiCoDriverMobile> createState() => _AiCoDriverMobileState();
}

class _AiCoDriverMobileState extends State<AiCoDriverMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your AI Co-driver',
          style: TextStyle(fontSize: 40, fontFamily: 'ralewaysemi'),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Download your ',
                  style: TextStyle(fontSize: 20, fontFamily: 'ralewaymedium'),
                ),
                TextSpan(
                  text: 'WATIF App ',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'comfortaaBold',
                    color: Color.fromRGBO(149, 160, 4, 1),
                  ),
                ),
                TextSpan(
                  text: 'today!',
                  style: TextStyle(fontSize: 20, fontFamily: 'ralewaymedium'),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: MyUtility(context).width / 1.125,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                  fontSize: 18, fontFamily: 'raleway', color: Colors.black),
              children: [
                TextSpan(
                  text: 'Hit the road with confidence and ditch the stress with  ',
                ),
                TextSpan(
                  text: 'watif!',
                  style: TextStyle(fontFamily: 'comfortaaMedium'),
                ),
                TextSpan(
                  text:
                      ' This is your free, all-in-one automotive app that empowers you with everything you need.',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MyUtility(context).height * 0.0465,
              width: MyUtility(context).width * 0.32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/AppleStore.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.0465,
              width: MyUtility(context).width * 0.32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/Google Play.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: MyUtility(context).height * 0.0465,
              width: MyUtility(context).width * 0.32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/WindowsStore.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Container(
          height: MyUtility(context).height * 0.04,
          width: MyUtility(context).width * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/starsmobile.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        Container(
          width: MyUtility(context).width * 0.41,
          height: MyUtility(context).height * 0.05,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Material(
                            child: MobilePage3(),
                          )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                Text(
                  "Learn More",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'raleway',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MyUtility(context).width * 0.01,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
