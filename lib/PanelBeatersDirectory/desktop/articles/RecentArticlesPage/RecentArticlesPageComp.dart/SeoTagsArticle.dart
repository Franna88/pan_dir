import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/articles/RecentArticlesPage/RecentArticlesPageComp.dart/SeoTags.dart';

class SeoTagsArticle extends StatefulWidget {
  const SeoTagsArticle({super.key});

  @override
  State<SeoTagsArticle> createState() => _SeoTagsArticleState();
}

class _SeoTagsArticleState extends State<SeoTagsArticle> {
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
              fontSize: 15.64,
              fontStyle: FontStyle.italic,
              fontFamily: 'raleway',
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Row(
          children: [
            SeoTags(seoTag: 'Lightstone'),
            const SizedBox(width: 5,),
            SeoTags(seoTag: 'EchoMBR'),
            const SizedBox(width: 5,),
            SeoTags(seoTag: 'KAI Results'),
            const SizedBox(width: 5,),
            SeoTags(seoTag: 'Panelbeaters'),
          ],
        )
      ],
    );
  }
}
