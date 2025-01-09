import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class PanelShopText extends StatefulWidget {
  final Map<String, String> contactData;
  const PanelShopText({super.key, required this.contactData});

  @override
  State<PanelShopText> createState() => _PanelShopTextState();
}

class _PanelShopTextState extends State<PanelShopText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.395,
      height: MyUtility(context).height * 0.170,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 520.2,
                child: Text(
                  'Is this your Panel Shop?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    height: 0,
                  ),
                ),
              ),
              SizedBox(
                width: 520.2,
                child: Text(
                  'Reach more qualified leads and grow your business with the Panel Beater Directory! Our powerful client-to-company platform connects you with a vast network of potential customers.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.0115,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
