import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MobileYoutubeButton extends StatefulWidget {
  Function onPressed;
  MobileYoutubeButton({super.key, required this.onPressed});

  @override
  State<MobileYoutubeButton> createState() => _MobileYoutubeButtonState();
}

class _MobileYoutubeButtonState extends State<MobileYoutubeButton> {
  bool isPressed = false ;
  @override
  Widget build(BuildContext context) {
    return Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                    widget.onPressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPressed ? Colors.black : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Positioned(
                            left: 8,
                            top: 8,
                            child: Container(
                              child: Center(
                                child: Container(
                                  height: 12,
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
                                color: const Color.fromARGB(255, 243, 21, 5),
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
                          color: isPressed ? Colors.white : Colors.black,
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
            );
  }
}