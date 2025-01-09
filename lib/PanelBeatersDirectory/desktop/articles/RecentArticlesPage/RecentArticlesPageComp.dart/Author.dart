import 'package:flutter/material.dart';

class Author extends StatefulWidget {
  final Color? otherDirectoryTextColor;
  const Author({super.key, this.otherDirectoryTextColor});

  @override
  State<Author> createState() => _AuthorState();
}

class _AuthorState extends State<Author> {
  @override
  Widget build(BuildContext context) {
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
                SizedBox(width: 10), // Adjust spacing between bullet and text
                Text(
                  'Article by Wena Cronje ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 13.6,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Icon(
                  Icons.circle,
                  size: 6,
                  color: Colors.black.withOpacity(0.5),
                ),
                SizedBox(width: 10), // Adjust spacing between bullet and text
                Text(
                  'Fri 28 June, 2024',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 13.6,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10), // Adjust
                Icon(
                  Icons.circle, // You can use a different icon if you prefer
                  size: 6,
                  color: Colors.black.withOpacity(0.5),
                ),
                SizedBox(width: 10),
                Text(
                  '10 min read',
                  style: TextStyle(
                    color: widget.otherDirectoryTextColor == null
                        ? Color(0xFFE5882F)
                        : widget.otherDirectoryTextColor,
                    fontSize: 13.6,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
