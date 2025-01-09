import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class UltimateBuisnessTool extends StatefulWidget {
  const UltimateBuisnessTool({super.key});

  @override
  State<UltimateBuisnessTool> createState() => _UltimateBuisnessToolState();
}

class _UltimateBuisnessToolState extends State<UltimateBuisnessTool> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Your ultimate business tool",
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'ralewaysemi',
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Your CSI success contributes to your business success and assists both prospects and industry users. Your updated Lightstone EchoMBR KAI results are now available in your online Panel Beaters Directory Profile* and your Owners Portal. * Results are public-facing for Featured Members only, you have the option to switch it off in the Owners Portal",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'raleway',
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        ),
        Container(
          width: MyUtility(context).width / 1.1,
          height: MyUtility(context).height / 1.5,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.08,
        ),
        SizedBox(
          width: MyUtility(context).width / 1.1,
          child: Text(
            "Author: ",
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'ralewayit',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
