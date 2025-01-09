import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class JoinUsMobile extends StatefulWidget {
  const JoinUsMobile({super.key});

  @override
  State<JoinUsMobile> createState() => _JoinUsMobileState();
}

class _JoinUsMobileState extends State<JoinUsMobile> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MyUtility(context).height * 0.03,
          ),
          Text(
            'Want to join us?',
            style: TextStyle(fontSize: 42, fontFamily: 'ralewaysemi'),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Container(
                width: MyUtility(context).width,
                height: MyUtility(context).height * 1.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/NewJoinUs.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                /* child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: MyUtility(context).height * 0.07,
                    ),
                    Text(
                      'Step 1',
                      style: TextStyle(fontSize: 22, fontFamily: 'ralewaybold'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.005,
                    ),
                    SizedBox(
                      width: MyUtility(context).width / 1.6,
                      child: Text(
                        'Navigate to the official directory website you want to join.',
                        style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.051,
                    ),
                    Text(
                      'Step 2',
                      style: TextStyle(fontSize: 22, fontFamily: 'ralewaybold'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.005,
                    ),
                    SizedBox(
                      width: MyUtility(context).width / 1.6,
                      child: Text(
                        'Click on “Get Listed Today” in the menu and follow our easy online registration process.',
                        style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.04,
                    ),
                    Text(
                      'Step 3',
                      style: TextStyle(fontSize: 22, fontFamily: 'ralewaybold'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.005,
                    ),
                    SizedBox(
                      width: MyUtility(context).width / 1.6,
                      child: Text(
                        'Receive email confirmation of membership and Owners Portal login detail.',
                        style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.05,
                    ),
                    Text(
                      'Step 4',
                      style: TextStyle(fontSize: 22, fontFamily: 'ralewaybold'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.005,
                    ),
                    SizedBox(
                      width: MyUtility(context).width / 1.6,
                      child: Text(
                        'Log into your Owners Portal to review, update & manage all your business information in real-time.',
                        style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.055,
                    ),
                  ],
                ),*/
              ),
            ),
          )
        ],
      ),
    );
  }
}
