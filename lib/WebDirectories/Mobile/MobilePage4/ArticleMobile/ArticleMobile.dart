import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/ArticlesContainermobile.dart';
import 'package:webdirectories/WebDirectories/Mobile/MobilePage4/ArticleMobile/ArticlesComponents/ArticlesSliderMobile.dart';
import 'package:webdirectories/myutility.dart';

class ArticleMobile extends StatefulWidget {
  const ArticleMobile({super.key});

  @override
  State<ArticleMobile> createState() => _ArticleMobileState();
}

class _ArticleMobileState extends State<ArticleMobile> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Recent articles',
          style: TextStyle(
              fontSize: 46,
              fontFamily: 'ralewaysemi',
              color: Color(0xFF0E1013)),
        ),
        Container(
          width: MyUtility(context).width / 1.4,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: TextFormField(
            controller: search,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              labelText: 'Search Keywords',
              labelStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'raleway',
                color: Colors.black,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  right: 8,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GestureDetector(
                    onTap: () {
                      // Define your onTap action here
                    },
                    child: Icon(Icons.close, color: Colors.black,)
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MyUtility(context).height * 0.02,
        ),
        ArticlesSliderMobile()
      ],
    );
  }
}
