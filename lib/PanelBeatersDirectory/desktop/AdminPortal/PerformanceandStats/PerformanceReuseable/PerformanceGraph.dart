import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class Performancegraph extends StatefulWidget {
  List daysAmount;
  double yAmount;

  Performancegraph({
    super.key,
    required this.daysAmount,
    required this.yAmount,
  });
  @override
  State<Performancegraph> createState() => _PerformancegraphState();
}

class _PerformancegraphState extends State<Performancegraph> {
  List<FlSpot> data = [];

  mapData() {
    data.clear();
    for (int i = 0; i < (widget.daysAmount).length; i++) {
      var index = double.parse(i.toString());

      setState(() {
        data.add(FlSpot(index, widget.daysAmount[i]['views']));
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mapData();
    return Column(
      children: [
        Container(
          width: MyUtility(context).width * 0.45,
          height: MyUtility(context).height * 0.42,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                horizontalInterval: 1.5,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: const Color(0xff37434d),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
              ),
              borderData: FlBorderData(
                show: false,
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: data,
                  isCurved: true,
                  color: const Color(0xFFF59121),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFF59121).withOpacity(0.4),
                        const Color(0x00822776).withOpacity(0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  dotData: FlDotData(
                    show: true,
                    checkToShowDot: (spot, barDate) {
                      return spot.x >= 1;
                    },
                    getDotPainter: (spot, percent, barData, index) {
                      if (spot.x == 4) {
                        return FlDotCirclePainter(
                          radius: 6,
                          color: Colors.white,
                          strokeWidth: 2,
                          strokeColor: const Color(0xfffbb03b),
                        );
                      } else {
                        return FlDotCirclePainter(
                          radius: 0,
                          color: Colors.transparent,
                        );
                      }
                    },
                  ),
                  curveSmoothness: 0.35,
                  preventCurveOverShooting: true,
                  barWidth: 4,
                ),
              ],
              minX: 0,
              maxX: double.parse((widget.daysAmount.length).toString()),
              minY: 0,
              maxY: widget.yAmount,
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.01,
        ),
        Text(
          'Months',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFFD6D6D6),
            fontSize: 19.23,
            fontFamily: 'ralewaymedium',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
