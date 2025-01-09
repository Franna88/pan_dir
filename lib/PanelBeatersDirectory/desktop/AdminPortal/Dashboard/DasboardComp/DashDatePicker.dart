import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:webdirectories/myutility.dart';

class CalendarPickerPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          color: Color(0xFF0E1013),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return MonthWidget(monthIndex: index);
            },
          ),
        ),
      ),
    );
  }
}

class MonthWidget extends StatelessWidget {
  final int monthIndex;

  MonthWidget({required this.monthIndex});

  @override
  Widget build(BuildContext context) {
    DateTime firstDayOfMonth = DateTime(DateTime.now().year, monthIndex + 1, 1);
    String monthName = DateFormat('MMMM').format(firstDayOfMonth);

    return Card(
      color: Color(0xFF292E31),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              monthName,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: DateUtils.getDaysInMonth(
                  firstDayOfMonth.year, firstDayOfMonth.month),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, dayIndex) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle date selection
                      Navigator.of(context)
                          .pop(); // Close the dialog after selection
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: dayIndex == DateTime.now().day &&
                                monthIndex == DateTime.now().month - 1
                            ? Colors.green
                            : Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          (dayIndex + 1).toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
