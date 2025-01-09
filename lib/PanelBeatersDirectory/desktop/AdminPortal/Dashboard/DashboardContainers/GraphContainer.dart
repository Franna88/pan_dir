import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/BarGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/IconText.dart';

class GraphContaier extends StatefulWidget {
  const GraphContaier({super.key});

  @override
  State<GraphContaier> createState() => _GraphContaierState();
}

class _GraphContaierState extends State<GraphContaier> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: widthDevice < 1500 ? 226.44 : heightDevice * 0.25,
      width: widthDevice < 1500 ? 452.88 : widthDevice * 0.35,
      // width: ,
      //height: ,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Directory Performance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.6,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                IconText(
                  visitors: '+25 visitors ',
                  month: 'February 2024',
                ),
                IconText(
                  visitors: '+25 visitors ',
                  month: 'Current Month',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '450 visitors',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.48,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Total Views',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.6,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                    scale: widthDevice < 1650 ? 1 : 1.3,
                    child: CustomBarGraph()),
              ],
            ),
            Column(
              children: [SvgPicture.asset('images/Briefcase.svg')],
            )
          ],
        ),
      ),
    );
  }
}
