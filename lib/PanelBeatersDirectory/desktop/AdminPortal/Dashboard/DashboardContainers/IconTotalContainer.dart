import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IcontTotalContainer extends StatefulWidget {
  final String iconpath;
  final String description;
  final String total;
  final Color colorsvgBack;

  const IcontTotalContainer(
      {super.key,
      required this.iconpath,
      required this.description,
      required this.total,
      required this.colorsvgBack});

  @override
  State<IcontTotalContainer> createState() => _IcontTotalContainerState();
}

class _IcontTotalContainerState extends State<IcontTotalContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
          width: 194.48,
          height: 104.72,
          decoration: ShapeDecoration(
            color: Color(0xFFECECEC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x7F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 50.32,
                    height: 61.2,
                    decoration: ShapeDecoration(
                      color: widget.colorsvgBack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x7F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(widget.iconpath),
                      ),
                    )),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.32,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      widget.total,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.76,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
