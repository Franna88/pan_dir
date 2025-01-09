import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/ScrollContainerMobile/ScrollContainer1.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/ScrollContainerMobile/ScrollContainer2.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/DirectoriesWayMobile.dart/DirectoriesWayMobileComponents/ScrollContainerMobile/ScrollContainer3.dart';
import 'package:webdirectories/myutility.dart';

class DirectoriesScrollMobile extends StatefulWidget {
  const DirectoriesScrollMobile({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  _DirectoriesScrollMobileState createState() =>
      _DirectoriesScrollMobileState();
}

class _DirectoriesScrollMobileState extends State<DirectoriesScrollMobile> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MyUtility(context).width / 1.1,
          height: 350,
          margin: EdgeInsets.symmetric(vertical: 16.0),
          child: PageView.builder(
            itemCount: 1000,
            controller: widget.controller, // Use the passed controller here
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              final containerIndex = index % 3;
              switch (containerIndex) {
                case 0:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MyUtility(context).width / 1.2,
                      height: MyUtility(context).height / 2.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F3F4),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ScrollContainer1(),
                    ),
                  );
                case 1:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MyUtility(context).width / 1.2,
                      height: MyUtility(context).height / 2.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F3F4),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ScrollContainer2(),
                    ),
                  );
                case 2:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MyUtility(context).width / 1.2,
                      height: MyUtility(context).height / 2.8,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F3F4),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ScrollContainer3(),
                    ),
                  );
                default:
                  return Container(); // Placeholder
              }
            },
          ),
        ),
      ],
    );
  }
}
