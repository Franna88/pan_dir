import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/widgets.dart';

class AboutUSTextContainer extends StatefulWidget {
  final String aboutUsText;
  const AboutUSTextContainer({super.key, required this.aboutUsText});

  @override
  State<AboutUSTextContainer> createState() => _AboutUSTextContainerState();
}

class _AboutUSTextContainerState extends State<AboutUSTextContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 553.92,
      height: 487.2,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                'About Us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: DraggableScrollbar.rrect(
                controller: _scrollController,
                backgroundColor: Colors.grey,
                alwaysVisibleScrollThumb: true,
                child: ListView(
                  controller: _scrollController,
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 35),
                        child: Html(
                          data: widget.aboutUsText == ''
                              ? '<p>No more information found<p>'
                              : widget.aboutUsText,
                          style: {
                            "h1": Style(
                              color: Colors.white,
                              fontFamily: 'raleway',
                            ),
                            "p": Style(
                              color: Colors.white,
                              fontFamily: 'raleway',
                            ),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
