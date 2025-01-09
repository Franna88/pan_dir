import 'package:flutter/material.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage2/OurStoryMobile/OurStoryMobileComponents/TextScrollMobile.dart';
import 'package:webdirectories/myutility.dart';

class OurStoryMobile extends StatefulWidget {
  const OurStoryMobile({Key? key}) : super(key: key);

  @override
  State<OurStoryMobile> createState() => _OurStoryMobileState();
}

class _OurStoryMobileState extends State<OurStoryMobile> {
  final PageController _controller = PageController();
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 630,
      decoration: BoxDecoration(
        color: Color(0xFF0E1013),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "A tale of passion, innovation and perseverance...",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'ralewaybold',
                color: Color(0xFF65DAFF),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Our Story',
                style: TextStyle(
                  fontSize: 42,
                  fontFamily: 'ralewaysemi',
                  color: Colors.white,
                ),
              ),
            ),
            TextScrollMobile(controller: _controller),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                    if (_controller.hasClients) {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color:  Colors.white,
                          width: 1.0),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: index == 0 ? Colors.white : Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                    if (_controller.hasClients) {
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      color: index == 1 ? Colors.black : Colors.white,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: index == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
