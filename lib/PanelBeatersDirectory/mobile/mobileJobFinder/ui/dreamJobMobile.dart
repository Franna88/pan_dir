import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class DreamJobMobile extends StatefulWidget {
  const DreamJobMobile({super.key});

  @override
  State<DreamJobMobile> createState() => _DreamJobMobileState();
}

class _DreamJobMobileState extends State<DreamJobMobile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MyUtility(context).width / 1.2,
        decoration: ShapeDecoration(
          color: Color(0xFF181B1D),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(9.57),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width / 1.2,
              height: MyUtility(context).height * 0.3,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage("images/DreamJob.png"),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(9.57),
                    topRight: Radius.circular(9.57),
                  ),
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
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Let’s get you your\ndream job!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.4,
                      fontFamily: 'ralewaysemi',
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MyUtility(context).height * 0.01),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Introducing JobFinder, our contribution to assist job seekers looking for employment in the Auto Body Repair industry!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.64,
                        fontFamily: 'raleway',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: MyUtility(context).height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "384+",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFDC7825),
                              fontSize: 19.618,
                              fontFamily: 'ralewaysemi',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Current CV's",
                            style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 13.0,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.69,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "2109",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFDC7825),
                              fontSize: 19.618,
                              fontFamily: 'ralewaysemi',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Shops",
                            style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 13.0,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.69,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "100%",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFDC7825),
                              fontSize: 19.618,
                              fontFamily: 'ralewaysemi',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Free service",
                            style: TextStyle(
                              color: Color(0xFFF4F4F4),
                              fontSize: 13.0,
                              fontFamily: 'raleway',
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.69,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MyUtility(context).height * 0.01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
