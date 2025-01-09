import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/mobileRecentArticles/ui/MobileSeo.dart';
import 'package:webdirectories/myutility.dart';

class ArticleDescriptionContainer extends StatefulWidget {
  final String image;
  final String category;
  final String headline;
  final String writer;
  final String description;
  final VoidCallback onpress;

  const ArticleDescriptionContainer(
      {Key? key,
      required this.image,
      required this.category,
      required this.headline,
      required this.writer,
      required this.description,
      required this.onpress})
      : super(key: key);

  @override
  State<ArticleDescriptionContainer> createState() =>
      _ArticleDescriptionContainerState();
}

class _ArticleDescriptionContainerState
    extends State<ArticleDescriptionContainer> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: MyUtility(context).width / 1.2,
        decoration: BoxDecoration(
          color: Color(0xFF0E1013),
          borderRadius: BorderRadius.circular(15.12),
          border: Border.all(width: 0.64, color: Colors.white),
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
              width: 600,
              height: 200,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.12),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: Text(
                widget.category,
                style: TextStyle(
                  fontSize: 15.94,
                  fontFamily: 'ralewaybold',
                  color: Color(0xFFFF8728),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
              child: SizedBox(
                height: MyUtility(context).height * 0.075,
                child: Text(
                  widget.headline,
                  style: TextStyle(
                    fontSize: 21.76,
                    fontFamily: 'ralewaysemi',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 15.94,
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
              padding: const EdgeInsets.fromLTRB(10, 2, 10, 0),
              child: SizedBox(
                child: Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'raleway',
                    color: Colors.white,
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
                    MobileSeo(text: 'Lightstone'),
                    MobileSeo(text: 'EchoMBR'),
                    MobileSeo(text: 'KAI Results'),
                    MobileSeo(text: 'Panelbeaters'),
                    Spacer(),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: widget.onpress,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(4),
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
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
