import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class Finance extends StatefulWidget {
  const Finance({super.key});

  @override
  State<Finance> createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            width: MyUtility(context).width * 0.84,
            height: MyUtility(context).height * 0.12,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/finance.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          width: MyUtility(context).width * 0.84,
          height: MyUtility(context).height * 0.12,
          decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.4,
        )
      ],
    );
  }
}
