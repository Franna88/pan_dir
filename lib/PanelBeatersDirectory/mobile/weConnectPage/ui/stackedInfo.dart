import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class StackedInfo extends StatelessWidget {
  const StackedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: 250,
        child: Stack(children: [
          Positioned(
            top: 15,
            left: 125,
            child: SizedBox(
              height: 90,
              child: new Center(
                child: new Container(
                  margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                  width: 1,
                  color: Color.fromARGB(193, 114, 113, 113),
                ),
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: Column(
              children: [
                Text(
                  '44M',
                  style: TextStyle(
                    color: Color(0xFFF19A40),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  '\nUnique Views',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: MyUtility(context).width < 1600 ? 16 : 20,
                    fontFamily: 'raleway',
                    height: 1,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 150,
            top: 65,
            child: Column(
              children: [
                Text(
                  '1765',
                  style: TextStyle(
                    color: Color(0xFFF19A40),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  '\nCities & \nSuburbs',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: MyUtility(context).width < 1600 ? 16 : 20,
                    fontFamily: 'raleway',
                    height: 1,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 36,
            top: 130,
            child: Column(
              children: [
                Text(
                  '8',
                  style: TextStyle(
                    color: Color(0xFFF19A40),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  '\nCountries',
                  style: TextStyle(
                    color: Color(0xFFFAFAFA),
                    fontSize: MyUtility(context).width < 1600 ? 16 : 20,
                    fontFamily: 'raleway',
                    height: 1,
                    letterSpacing: 0.69,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
