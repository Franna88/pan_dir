import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class Hours extends StatefulWidget {
  final String days;
  final String from;
  final String till;

  const Hours(
      {super.key, required this.days, required this.from, required this.till});

  @override
  State<Hours> createState() => _HoursState();
}

class _HoursState extends State<Hours> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.317,
        height: MyUtility(context).height * 0.065,
        decoration: ShapeDecoration(
          color: Color(0x660F253A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.days,
                style: TextStyle(
                  color: Color(0xFF0F253A),
                  fontSize: 20.4,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Container(
                width: MyUtility(context).width * 0.125,
                height: MyUtility(context).height * 0.045,
                decoration: ShapeDecoration(
                  color: Color(0xFF0F253A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    '${widget.from} - ${widget.till}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.76,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
