import 'package:flutter/material.dart';

class AuthorMobile extends StatefulWidget {
  final Color? otherDirectoryTextColor;
  const AuthorMobile({super.key, this.otherDirectoryTextColor});

  @override
  State<AuthorMobile> createState() => _AuthorMobileState();
}

class _AuthorMobileState extends State<AuthorMobile> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: 40.0,
          height: 39.44,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage("images/wena.png"),
              fit: BoxFit.cover,
            ),
            shape: OvalBorder(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 5), // Adjust spacing between bullet and text
                Text(
                  'Article by Wena Cronje ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: widthDevice < 400 ? 12 : 13.6,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),

                // Adjust spacing between bullet and text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 6,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Fri 28 June, 2024',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: widthDevice < 400 ? 12 : 13.6,
                            fontFamily: 'raleway',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons
                              .circle, // You can use a different icon if you prefer
                          size: 6,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '10 min read',
                          style: TextStyle(
                            color: widget.otherDirectoryTextColor == null
                                ? Color(0xFFE5882F)
                                : widget.otherDirectoryTextColor,
                            fontSize: widthDevice < 400 ? 12 : 13.6,
                            fontFamily: 'ralewaymedium',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ), // Adjust
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
