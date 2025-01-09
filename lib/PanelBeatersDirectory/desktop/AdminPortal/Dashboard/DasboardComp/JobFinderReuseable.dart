import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobFinderReuseable extends StatefulWidget {
  final String appliedDate;
  final String occupation;
  final String contact;
  final VoidCallback onPress;

  const JobFinderReuseable(
      {super.key,
      required this.appliedDate,
      required this.occupation,
      required this.contact,
      required this.onPress});

  @override
  State<JobFinderReuseable> createState() => _JobFinderReuseableState();
}

class _JobFinderReuseableState extends State<JobFinderReuseable> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: widget.onPress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 7.5),
        child: Container(
          width: widthDevice,
          height: 40.8,
          decoration: ShapeDecoration(
            color: Color(0xFFA1A1A1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  child: Text(
                    widget.appliedDate,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 125.12,
                  child: Text(
                    widget.occupation,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.6,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                Text(
                  widget.contact,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.6,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SvgPicture.asset('images/suitcase.svg')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
