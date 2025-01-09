import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PerformanceandStats/PerformanceReuseable/PerformanceListContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PerformanceandStats/PerformanceReuseable/StatGraphContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';
import '../Dashboard/DashboardContainers/DashProfileView.dart';

class PerformanceAndStats extends StatefulWidget {
  Function getListingsId;
  PerformanceAndStats({super.key, required this.getListingsId});

  @override
  State<PerformanceAndStats> createState() => _PerformanceAndStatsState();
}

class _PerformanceAndStatsState extends State<PerformanceAndStats> {
  final _scrollController = ScrollController();
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = true; // Track loading
  List viewList = [];
  Future<void> _fetchViewData() async {
    try {
      var doc = await widget.getListingsId();
      // Fetch the user's document from Firestore based on their ID
      final viewData =
          await _firestore.collection('views').doc(doc.toString()).get();

      if (viewData.exists) {
        setState(() {
          viewList = (viewData.get('views'));
        });
      }
    } catch (e) {
      print('Error fetching user data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    _fetchViewData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width,
      height: MyUtility(context).height,
      decoration: BoxDecoration(color: Color(0xFF171616)),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 0, right: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: MyUtility(context).width * 0.8,
              height: MyUtility(context).height * 0.85,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.57, -0.82),
                  end: Alignment(-0.57, 0.82),
                  colors: [
                    Color(0x19777777),
                    Colors.white.withOpacity(0.4),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0xBF000000),
                    blurRadius: 24,
                    offset: Offset(0, 4),
                    spreadRadius: -1,
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review your Profile Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6,
                          fontFamily: 'ralewayBold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.60,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Gain '),
                            TextSpan(
                              text: 'valuable insights',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' into your panel beater business\'s performance. '),
                            TextSpan(
                              text:
                                  'Please note that we only keep 12 months of detailed data to protect our data integrity.',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10), // Add spacing
                      Visibility(
                          visible: viewList.length >= 1,
                          child: StatGraphContainer(views: viewList)),
                      SizedBox(height: 10),
                      Text(
                        'Review your Profile Analytics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.6,
                          fontFamily: 'ralewayBold',
                        ),
                      ),
                      SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.60,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: 'Gain '),
                            TextSpan(
                              text: 'valuable insights',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'ralewaybold',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' into your panel beater business\'s performance. '),
                            TextSpan(
                              text:
                                  'Please note that we only keep 12 months of detailed data to protect our data integrity.',
                              style: TextStyle(
                                color: Color(0xFFEF9040),
                                fontFamily: 'raleway',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                          height: MyUtility(context).height * 0.5,
                          child: DraggableScrollbar.rrect(
                            controller: _scrollController,
                            backgroundColor: Color(0x7F9E9E9F),
                            alwaysVisibleScrollThumb: true,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: viewList.length,
                              itemBuilder: (context, index) {
                                final document = viewList[index];

                                DateTime viewDate = (document['date']).toDate();

                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(viewDate!);

                                String formattedTime =
                                    DateFormat('hh:mm a').format(viewDate);
                                return PerformanceListContainer(
                                  ipAddress: document['ip']!,
                                  linkReference: "No DATA ,CHECK with CLIENT",
                                  dateAndTime:
                                      "${formattedDate} ${formattedTime}",
                                  isEven: index % 2 == 0,
                                );
                              },
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
