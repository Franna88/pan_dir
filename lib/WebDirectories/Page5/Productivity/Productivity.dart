import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Page5/Productivity/WorkspaceComponents/Clearbutton.dart';
// ignore: unused_import
import 'package:webdirectories/WebDirectories/TopNavBar/TopNavBar.dart';
import 'package:webdirectories/myutility.dart';

class Productivity extends StatefulWidget {
  const Productivity({super.key});

  @override
  State<Productivity> createState() => _ProductivityState();
}

class _ProductivityState extends State<Productivity> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width / 1.2,
          height: MyUtility(context).height / 1.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(
                'images/workspace2.jpg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MyUtility(context).width / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Productivity in the workplace",
                        style: TextStyle(
                          fontSize: 42,
                          fontFamily: 'ralewaybold',
                          color: Colors.white,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'By ',
                              style: TextStyle(
                                fontFamily: 'raleway',
                              ),
                            ),
                            TextSpan(
                              text: 'Thys Conje',
                              style: TextStyle(
                                fontFamily: 'ralewaysemi',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MyUtility(context).width / 2.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MyUtility(context).width * 0.01,
                          ),
                          ClearButton(Text: 'Productivity'),
                          ClearButton(Text: 'Businesses'),
                          ClearButton(Text: 'Team Work'),
                          ClearButton(Text: 'Workplace'),
                          SizedBox(
                            width: MyUtility(context).width * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
