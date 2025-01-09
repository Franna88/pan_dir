import 'package:flutter/material.dart';

import 'package:webdirectories/myutility.dart';

class FinanceMobile extends StatefulWidget {
  const FinanceMobile({super.key});

  @override
  State<FinanceMobile> createState() => _FinanceMobileState();
}

class _FinanceMobileState extends State<FinanceMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyUtility(context).height * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: MyUtility(context).width * 0.9,
            height: MyUtility(context).height * 0.04,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/finance.png"),
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
