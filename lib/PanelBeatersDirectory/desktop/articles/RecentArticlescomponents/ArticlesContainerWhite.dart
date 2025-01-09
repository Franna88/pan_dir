import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlescomponents/seowhite.dart';
import 'package:webdirectories/myutility.dart';

class ArticlesContainerWhite extends StatefulWidget {
  final String image;
  final String category;
  final String headline;
  final String writer;
  final String description;
  final VoidCallback onPress;

  const ArticlesContainerWhite({
    Key? key,
    required this.image,
    required this.category,
    required this.headline,
    required this.writer,
    required this.description,
    required this.onPress,
  }) : super(key: key);

  @override
  State<ArticlesContainerWhite> createState() => _ArticlesContainerWhiteState();
}

class _ArticlesContainerWhiteState extends State<ArticlesContainerWhite> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: _isHovered
              ? MyUtility(context).width * 0.18
              : MyUtility(context).width * 0.17,
          height: _isHovered
              ? MyUtility(context).height * 0.372
              : MyUtility(context).height * 0.355,
          decoration: BoxDecoration(
            color: Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(11.52),
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
              Container(
                height: MyUtility(context).height * 0.165,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11.52),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: _isHovered ? 15.0 : 13.0,
                    fontFamily: 'ralewaybold',
                    color: Color(0xFFFF8728),
                  ),
                  child: Text(widget.category),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: _isHovered ? 16.0 : 14.0,
                    fontFamily: 'ralewaysemi',
                    color: Colors.black,
                  ),
                  child: Text(widget.headline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: _isHovered ? 11.25 : 9.25,
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
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  style: TextStyle(
                    fontSize: _isHovered ? 12.75 : 10.75,
                    fontFamily: 'raleway',
                    color: Colors.black,
                  ),
                  child: Text(widget.description),
                ),
              ),
              Visibility(
                visible: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 5, 8),
                  child: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SEOWhite(text: 'Lightstone'),
                        SEOWhite(text: 'EchoMBR'),
                        SEOWhite(text: 'KAI Results'),
                        SEOWhite(text: 'Panelbeaters'),
                        SizedBox(width: MyUtility(context).width * 0.01),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: widget.onPress,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.all(0), // Reduced padding
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
