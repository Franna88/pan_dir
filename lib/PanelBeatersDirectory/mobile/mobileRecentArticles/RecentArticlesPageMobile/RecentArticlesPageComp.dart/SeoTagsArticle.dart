import 'package:flutter/material.dart';

import 'SeoTagsMobile.dart';


class SeoTagsArticleMobile extends StatefulWidget {
  const SeoTagsArticleMobile({super.key});

  @override
  State<SeoTagsArticleMobile> createState() => _SeoTagsArticleMobileState();
}

class _SeoTagsArticleMobileState extends State<SeoTagsArticleMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Read more about:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10.53,
              fontStyle: FontStyle.italic,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 5,),
            SeoTagsMobile(seoTag: 'Lightstone'),
            const SizedBox(width: 5,),
            SeoTagsMobile(seoTag: 'EchoMBR'),
            const SizedBox(width: 5,),
            SeoTagsMobile(seoTag: 'KAI Results'),
            const SizedBox(width: 5,),
            SeoTagsMobile(seoTag: 'Panelbeaters'),
          ],
        )
      ],
    );
  }
}
