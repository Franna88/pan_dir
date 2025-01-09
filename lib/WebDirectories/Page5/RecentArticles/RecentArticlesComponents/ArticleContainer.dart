// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/RecentArticlesComponents/SEOContainer.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesContainer extends StatefulWidget {
  final String image;
  final String category;
  final String headline;
  final String writer;
  final String description;
  final VoidCallback onpress;

  const ArticlesContainer(
      {Key? key,
      required this.image,
      required this.category,
      required this.headline,
      required this.writer,
      required this.description,
      required this.onpress})
      : super(key: key);

  @override
  State<ArticlesContainer> createState() => _ArticlesContainerState();
}

class _ArticlesContainerState extends State<ArticlesContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
        width: MyUtility(context).width / 3.9,
        height: MyUtility(context).height / 1.55,
        decoration: BoxDecoration(
          color: isHovered ? Color(0xFF0E1013) : Color(0xFFF4F4F4),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
              child: Text(
                widget.category,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ralewaybold',
                  color: Color(0xFF65DAFF),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
              child: SizedBox(
                height: MyUtility(context).height * 0.075,
                child: Text(
                  widget.headline,
                  style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'ralewaysemi',
                    color: isHovered ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xFF616161),
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By ',
                      style: TextStyle(
                        fontFamily: 'ralewaybold',
                      ),
                    ),
                    TextSpan(
                      text: widget.writer,
                      style: TextStyle(
                        fontFamily: 'raleway',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 2, 16, 0),
              child: SizedBox(
                height: MyUtility(context).height * 0.09,
                child: Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'raleway',
                    color: isHovered ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
              child: SizedBox(
                height: MyUtility(context).height * 0.05,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SEOContainer(text: 'Lightstone'),
                    SEOContainer(text: 'EchoMBR'),
                    SEOContainer(text: 'KAI Results'),
                    SEOContainer(text: 'Panelbeaters'),
                    SizedBox(width: MyUtility(context).width * 0.04),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: widget.onpress,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isHovered ? Colors.white : Colors.black,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: isHovered ? Colors.black : Colors.white,
                          ),
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
