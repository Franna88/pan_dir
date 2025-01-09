import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/myutility.dart';

class JoinUsContainer extends StatefulWidget {
  final String icon;
  final String header;
  final String paragraph;

  const JoinUsContainer(
      {super.key,
      required this.icon,
      required this.header,
      required this.paragraph});

  @override
  State<JoinUsContainer> createState() => _JoinUsContainerState();
}

class _JoinUsContainerState extends State<JoinUsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width / 5.5,
      height: MyUtility(context).height * 0.27,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3F4),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      widget.icon,
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Text(
                    widget.header,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'ralewaybold',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.paragraph,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'raleway',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
