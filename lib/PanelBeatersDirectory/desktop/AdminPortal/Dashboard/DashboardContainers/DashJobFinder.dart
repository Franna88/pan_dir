import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Dashboard/DasboardComp/DashJobReuseable.dart';
import 'package:webdirectories/myutility.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class DashJobFinder extends StatefulWidget {
  final VoidCallback onpress;

  const DashJobFinder({super.key, required this.onpress});

  @override
  State<DashJobFinder> createState() => _DashJobFinderState();
}

class _DashJobFinderState extends State<DashJobFinder> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
        width: MyUtility(context).width * 0.22,
        height: MyUtility(context).height * 0.4,
        decoration: ShapeDecoration(
          color: Color(0xFF2C2C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.19),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Job Finder',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.61,
                            fontFamily: 'ralewaybold',
                          ),
                        ),
                        Text(
                          'Latest Entries - View by Date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7.40,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'ralewayit',
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              '*24',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFF8728),
                                fontSize: 23.31,
                                fontFamily: 'Ralewaysemi',
                              ),
                            ),
                            SvgPicture.asset(
                              'images/Briefcase.svg',
                              color: Color(0xFFFFA500),
                              height: MyUtility(context).width * 0.015,
                            )
                          ],
                        ),
                        Text(
                          'New Job Requests',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFFF8728),
                            fontSize: 10.2,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date Applied',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.3984,
                        fontFamily: 'ralewayit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Position',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.3984,
                        fontFamily: 'ralewayit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Contact Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.3984,
                        fontFamily: 'ralewayit',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DraggableScrollbar.rrect(
                  controller: _scrollController,
                  backgroundColor: Color(0x7F9E9E9F),
                  alwaysVisibleScrollThumb: true,
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      DashJobReuseable(
                        date: '2024-12-01',
                        position: 'Paintless Dent Remover',
                        number: '084 585 8569',
                      ),
                      DashJobReuseable(
                        date: '2024-10-22',
                        position: 'Apprentice',
                        number: '012 787 8974',
                      ),
                      DashJobReuseable(
                        date: '2024-09-17',
                        position: 'Financial Manager',
                        number: '079 654 7629',
                      ),
                      DashJobReuseable(
                        date: '2024-07-01',
                        position: 'Sales & Marketing',
                        number: '084 991 3232',
                      ),
                      DashJobReuseable(
                        date: '2024-05-30',
                        position: 'Panel Beater (Trade Tested)',
                        number: '082 665 6678',
                      ),
                      DashJobReuseable(
                        date: '2024-05-30',
                        position: 'Panel Beater (Trade Tested)',
                        number: '082 665 6678',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
