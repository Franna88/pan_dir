import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:webdirectories/myutility.dart';

class AboutUsTextContainerMobile extends StatefulWidget {
  final String aboutUsText;
  const AboutUsTextContainerMobile({super.key, required this.aboutUsText});

  @override
  State<AboutUsTextContainerMobile> createState() =>
      _AboutUsTextContainerMobileState();
}

class _AboutUsTextContainerMobileState
    extends State<AboutUsTextContainerMobile> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.58,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'About Us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.4,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              width: MyUtility(context).width * 0.72,
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
            )
          ],
        ),
      ),
    );
  }
}
