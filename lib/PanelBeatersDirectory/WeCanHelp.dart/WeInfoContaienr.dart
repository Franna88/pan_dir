import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/WeCanHelp.dart/WeBulletPoint.dart';

class WeInfoContainer extends StatelessWidget {
  final ScrollController scrollController;
  final String title;
  final String description;
  final String header;
  final List<WeBullet> bulletPoints;
  final String? keywords;

  const WeInfoContainer({
    required this.scrollController,
    required this.title,
    required this.description,
    required this.header,
    required this.bulletPoints,
    this.keywords,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Container(
      height: heightDevice * 0.68,
      width: widthDevice * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9.57),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: DraggableScrollbar.rrect(
        controller: scrollController,
        backgroundColor: Color(0x7FD9D9D9),
        alwaysVisibleScrollThumb: true,
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          children: [
            // Title
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'ralewaysemi',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'raleway',
                height: 1.5, // Improved line height for better readability
              ),
            ),
            const SizedBox(height: 8),

            // Header
            Text(
              header,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'ralewaysemi',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),

            // Bullet Points
            ...bulletPoints,

            // Keywords
            if (keywords != null) ...[
              const SizedBox(height: 16),
              Text(
                "Keywords: $keywords",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'ralewayit',
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
