import 'package:flutter/material.dart';

import 'ArticlesCommentContainerComp/ArticlesUserComments.dart';

class ArticlesCommentContainer extends StatefulWidget {
  const ArticlesCommentContainer({super.key});

  @override
  State<ArticlesCommentContainer> createState() =>
      _ArticlesCommentContainerState();
}

class _ArticlesCommentContainerState extends State<ArticlesCommentContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: 770.8,
        decoration: ShapeDecoration(
          color: Color(0xFFEFECEC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.16),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              child: SizedBox(
                width: 727.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'View all comments (15)',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.4,
                        fontFamily: 'ralewaysemi',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 727.6,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.80,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.black.withOpacity(0.30000001192092896),
                  ),
                ),
              ),
            ),
            ArticlesUserComments(
              username: 'Joe Motsepi',
              comment:
                  'Lightstone EchoMBR? What a bunch of corporate idiots. Just another pointless rating system just to pressure businesses.',
              timeAgo: '1 week ago',
            ),
            ArticlesUserComments(
              username: 'Pieter Vd Linde',
              comment:
                  'My EchoMBR results showed several panel beaters with high ratings. How can I narrow down my choices?',
              timeAgo: '1 week ago',
            ),
            ArticlesUserComments(
              username: 'Elise de Wits',
              comment:
                  'Pieter, what panel beater is closest to you? Check other reviews on their profile. Also, consider shops that specialize in the specific type of repair you need and compare quotes. ',
              timeAgo: '1 week ago',
            ),
            ArticlesUserComments(
              username: 'Joe Motsepi',
              comment:
                  'Lightstone EchoMBR? What a bunch of corporate idiots. Just another pointless rating system just to pressure businesses.',
              timeAgo: '1 week ago',
            ),
          ],
        ),
      ),
    );
  }
}
