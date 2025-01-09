import 'package:flutter/material.dart';

class YoutubeWatchButton extends StatefulWidget {
  const YoutubeWatchButton({super.key});

  @override
  State<YoutubeWatchButton> createState() => _YoutubeWatchButtonState();
}

class _YoutubeWatchButtonState extends State<YoutubeWatchButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return widthDevice > 1500
        ?
        // youtube button
        MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isHovered ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 9,
                            top: 9,
                            child: Container(
                              child: Center(
                                child: Container(
                                  height: 14,
                                  width: 19,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Icon(
                                Icons.smart_display,
                                color: const Color.fromARGB(255, 253, 17, 1),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Watch our video',
                        style: TextStyle(
                          color: isHovered ? Colors.white : Colors.black,
                          fontSize: 16,
                          fontFamily: 'ralewaymedium',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

        //*********** */
        // SMALLER SCREENS
        //************* */
        :

        // youtube button
        MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: isHovered ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 7,
                            top: 7,
                            child: Container(
                              child: Center(
                                child: Container(
                                  height: 10,
                                  width: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Center(
                              child: Icon(
                                Icons.smart_display,
                                color: const Color.fromARGB(255, 255, 17, 1),
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Watch our video',
                        style: TextStyle(
                          color: isHovered ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontFamily: 'ralewaymedium',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
