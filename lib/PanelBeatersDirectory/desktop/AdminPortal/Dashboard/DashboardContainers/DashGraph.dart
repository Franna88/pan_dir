import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashNewGraph.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/PreviousandCurrent.dart';
import 'package:webdirectories/myutility.dart';

import '../DasboardComp/DashDatePicker.dart';
import 'package:intl/intl.dart';

class DashGraph extends StatefulWidget {
  String userId;
  String? adminListingsId;
  Function getListingsId;
  DashGraph(
      {super.key,
      required this.userId,
      this.adminListingsId,
      required this.getListingsId});

  @override
  State<DashGraph> createState() => _DashGraphState();
}

class _DashGraphState extends State<DashGraph> {
  //var
  List viewList = [];
  final _firestore = FirebaseFirestore.instance;
  var previousMonth = DateFormat('MMMM yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month - 1));
  var currentMonth = DateFormat('MMMM yyyy')
      .format(DateTime(DateTime.now().year, DateTime.now().month));
  var previousMonthViews = 0;
  var currentMonthViews = 0;
  var monthDaysAmount = [];
  var yAmount = 0;
  var graphData = [];
  var firstDayMonth =
      DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  var lastDayMonth = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

  getYAmount(value) {
    if (value > yAmount) {
      setState(() {
        yAmount = value;
      });
    }
  }

  Future<void> _fetchViewData() async {
    try {
      // Fetch the user's document from Firestore based on their ID
      var doc = await widget.getListingsId();
      print(doc.toString());
      final viewData =
          await _firestore.collection('views').doc(doc.toString()).get();

      if (viewData.exists) {
        setState(() {
          viewList = (viewData.get('views'));
        });
      }
      getCurrentMonthsViewAmount();
      getPreviousMonthsViewAmount();
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        //_isLoading = false;
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
    for (int j = 0; j < (viewList).length; j++) {
      DateTime viewDate = (viewList[j]['date']).toDate();
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
    var days = getDaysInBetween();

    for (int i = 0; i < days.length; i++) {
      setState(() {
        monthDaysAmount.add(
            {"day": i + 1, "date": days[i], "views": getViewsAmount(days[i])});
      });
    }
  }

  getPreviousMonthsViewAmount() {
    (viewList).forEach((viewData) {
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

    (viewList).forEach((viewData) {
      DateTime date = (viewData['date'].toDate());

      var viewDate =
          DateFormat('MMMM yyyy').format(DateTime(date.year, date.month));

      if (viewDate == currentMonth) {
        setState(() {
          currentMonthViews++;
        });
      }
    });
  }

  @override
  void initState() {
    _fetchViewData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.42,
      height: MyUtility(context).height * 0.42,
      decoration: ShapeDecoration(
        color: Color(0xFF2C2C2C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.71),
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Profile Performance',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.61,
                    fontFamily: 'ralewaybold',
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CalendarPickerPopup();
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Text(
                          'Edit Dates',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFD6D6D6),
                            fontSize: 11.09,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ralewayit',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'images/Briefcase.svg',
                        color: Color(0xFFFFA500),
                        height: MyUtility(context).width * 0.011,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PreviousandCurrent(
                      visitors: '+ ${previousMonthViews} Visitors',
                      date: previousMonth,
                      previous: 'Previous',
                    ),
                    PreviousandCurrent(
                      visitors: '+ ${currentMonthViews} Visitors',
                      date: currentMonth,
                      previous: 'Current',
                    ),
                    SizedBox(
                      height: MyUtility(context).height * 0.02,
                    ),
                    Column(
                      children: [
                        Text(
                          'Total Views',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 10.8188,
                            fontFamily: 'ralewaymedium',
                          ),
                        ),
                        Text(
                          '${viewList.length}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFFF8728),
                              fontSize: 20.7264,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                DashNewGraph(
                  daysAmount: monthDaysAmount,
                  yAmount: double.parse(yAmount.toString()),
                  graphData: graphData,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
