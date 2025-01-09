import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class EchoMBR extends StatefulWidget {
  const EchoMBR({super.key});

  @override
  State<EchoMBR> createState() => _EchoMBRState();
}

class _EchoMBRState extends State<EchoMBR> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MyUtility(context).width / 1.8,
          child: Text(
            "See your Lightstone EchoMBR Results for February 2024",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'ralewaybold',
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            "Your CSI success contributes to your business success and assists both prospects and industry users.",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'raleway',
              color: Colors.black,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            'images/nightdrive.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.5,
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.05,
        )
      ],
    );
  }
}
