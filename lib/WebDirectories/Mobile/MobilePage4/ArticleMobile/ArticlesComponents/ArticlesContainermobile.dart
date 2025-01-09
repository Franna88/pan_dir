import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Page5/RecentArticles/RecentArticlesComponents/SEOContainer.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesContainerMobile extends StatefulWidget {
  final String image;
  final String catagory;
  final String headline;
  final String writer;
  final String discription;
  final VoidCallback onpress;

  const ArticlesContainerMobile(
      {Key? key,
      required this.image,
      required this.catagory,
      required this.headline,
      required this.writer,
      required this.discription,
      required this.onpress})
      : super(key: key);

  @override
  State<ArticlesContainerMobile> createState() =>
      _ArticlesContainerMobileState();
}

class _ArticlesContainerMobileState extends State<ArticlesContainerMobile> {
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: MyUtility(context).width / 1.15,
          height: MyUtility(context).height / 2.05,
          decoration: BoxDecoration(
            color: Color(0xFF0E1013),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                child: Text(
                  widget.catagory,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'ralewaybold',
                    color: Color(0xFF65DAFF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                child: SizedBox(
                  height: 60,
                  child: Text(
                    widget.headline,
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'ralewaysemi',
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.0,
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
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                child: SizedBox(
                  height: 75,
                  child: Text(
                    widget.discription,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'raleway',
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: widget.onpress,
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
