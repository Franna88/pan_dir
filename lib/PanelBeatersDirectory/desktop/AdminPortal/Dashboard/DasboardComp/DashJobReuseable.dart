import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/myutility.dart';

class DashJobReuseable extends StatefulWidget {
  final String date;
  final String position;
  final String number;

  const DashJobReuseable(
      {super.key,
      required this.date,
      required this.position,
      required this.number});

  @override
  State<DashJobReuseable> createState() => _DashJobReuseableState();
}

class _DashJobReuseableState extends State<DashJobReuseable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, right: 20),
      child: Container(
        width: 250.24,
        height: 36.68,
        decoration: ShapeDecoration(
          color: Color(0xFF3C4043),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.date,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7.40,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: MyUtility(context).width * 0.07,
                child: Text(
                  widget.position,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8999999761581421),
                    fontSize: 10.2,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                widget.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.2,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
