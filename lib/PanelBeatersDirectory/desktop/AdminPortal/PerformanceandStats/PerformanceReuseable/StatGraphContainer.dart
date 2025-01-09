import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';

import '../../../../../myutility.dart';
import '../../AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'PerformanceDatePicker.dart';
import 'PerformanceGraph.dart';
import 'PerformanceTags.dart';
import 'ProfileIconText.dart';
import 'package:intl/intl.dart';

class StatGraphContainer extends StatefulWidget {
  List views;
  StatGraphContainer({super.key, required this.views});

  @override
  State<StatGraphContainer> createState() => _StatGraphContainerState();
}

class _StatGraphContainerState extends State<StatGraphContainer> {
//var
  var previousMonth = DateFormat('MMMM yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month - 1));
  var currentMonth = DateFormat('MMMM yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month));
  var previousMonthViews = 0;
  var currentMonthViews = 0;
  var monthDaysAmount = [];
  var yAmount = 0;
  var graphData = [];
  final _firestore = FirebaseFirestore.instance;
  var firstDayMonth =
      DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  var lastDayMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  updateDates(type, value) {
    setState(() {
      if (type == "FromDate") {
        firstDayMonth = value;
      } else {
        lastDayMonth = value;
      }
    });
  }

  getNewDataForGraph() async {
    monthDaysAmount.clear();
    getDaysForGraph();
  }

  getYAmount(value) {
    if (value > yAmount) {
      setState(() {
        yAmount = value;
      });
    }
  }

  List<DateTime> getDaysInBetween() {
    List<DateTime> days = [];
    for (int i = 0; i <= lastDayMonth.difference(firstDayMonth).inDays; i++) {
      days.add(DateTime(
          firstDayMonth.year,
          firstDayMonth.month,
          // In Dart you can set more than. 30 days, DateTime will do the trick
          firstDayMonth.day + i));
    }
    return days;
  }

  getViewsAmount(date) {
    var viewAmount = 0;
    for (int j = 0; j < (widget.views).length; j++) {
      DateTime viewDate = (widget.views[j]['date']).toDate();
      String formattedDate = DateFormat('yyyy-MM-dd').format(viewDate);
      String normalDate = DateFormat('yyyy-MM-dd').format(date);

      if (formattedDate == normalDate) {
        viewAmount = viewAmount + 1;
      }
    }
    getYAmount(viewAmount);
    return viewAmount;
  }

  getDaysForGraph() {
    monthDaysAmount.clear();
    var days = getDaysInBetween();

    for (int i = 0; i < days.length; i++) {
      setState(() {
        monthDaysAmount.add(
            {"day": i + 1, "date": days[i], "views": getViewsAmount(days[i])});
      });
    }
    print(monthDaysAmount);
  }

  getPreviousMonthsViewAmount() {
    (widget.views).forEach((viewData) {
      DateTime date = (viewData['date'].toDate());
      var viewDate =
          DateFormat('MMMM yyyy').format(DateTime(date.year, date.month));

      if (viewDate == previousMonth) {
        setState(() {
          previousMonthViews++;
        });
      }
    });
  }

  getCurrentMonthsViewAmount() {
    getDaysForGraph();

    (widget.views).forEach((viewData) {
      DateTime date = (viewData['date'].toDate());
      print("DATE");
      print(date);
      var viewDate =
          DateFormat('MMMM yyyy').format(DateTime(date.year, date.month));
      print(viewDate);
      print(currentMonth);
      if (viewDate == currentMonth) {
        setState(() {
          currentMonthViews++;
        });
      }
    });
  }

  @override
  void initState() {
    print(widget.views);
    getCurrentMonthsViewAmount();
    getPreviousMonthsViewAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.75,
      height: MyUtility(context).height * 0.68,
      decoration: ShapeDecoration(
        color: Color(0xFF0E1013),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(44.72),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5.83,
            offset: Offset(0, 5.83),
            spreadRadius: 0,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Performancetags(
                    header: 'Total Lead Views',
                    figures: (widget.views.length).toString()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Profile Performance - Lead Views',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.47,
                      fontFamily: 'ralewaybold',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.47,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ProfileIconText(
                          visitors: '+${previousMonthViews} visitors',
                          date: '${previousMonth}',
                          previous: 'Previous'),
                      ProfileIconText(
                          visitors: '+${currentMonthViews} visitors',
                          date: '${currentMonth}',
                          previous: 'Current'),
                    ],
                  ),
                  Performancegraph(
                    daysAmount: monthDaysAmount,
                    yAmount: double.parse(
                      yAmount.toString(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PerformanceDatePicker(
                          firstDayMonth: firstDayMonth,
                          lastDayMonth: lastDayMonth,
                          updateDates: updateDates,
                          getNewDataForGraph: getNewDataForGraph),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: AddButton(
                            text: 'Search',
                            onPressed: () {
                              getNewDataForGraph();
                            }),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
