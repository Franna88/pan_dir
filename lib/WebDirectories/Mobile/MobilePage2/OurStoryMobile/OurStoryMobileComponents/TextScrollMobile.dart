import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class TextScrollMobile extends StatefulWidget {
  final PageController controller;

  const TextScrollMobile({Key? key, required this.controller})
      : super(key: key);

  @override
  State<TextScrollMobile> createState() => _TextScrollMobileState();
}

class _TextScrollMobileState extends State<TextScrollMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: PageView(
            controller: widget.controller,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: buildTextWidget(
                    "In the early days of the internet, finding information online was a challenge. Search engines were still in their infancy, and websites were often hidden away on obscure servers. In 2013 a South African entrepreneur, passionate about the automotive industry and evolving technology, Thys Cronje, and his two sons, Christoff and Ryno, saw the opportunity to make the internet more accessible and user-friendly. With persistence, patience and one laptop, they founded Web Directories, an independent company that would create niche comprehensive directories for various industries across Southern Africa."),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: buildTextWidget(
                    " Web Directories first product, the Panel Beater Directory, was an immediate success and became an invaluable resource for businesses and individuals alike, helping them to find the information they needed quickly and easily. It also empowered those who want to conduct business with others who shared their values and provided a recognized platform for qualified independent repair shops to serve South African motorists. Over the years the Web Directories has grown to become one of the leading providers of various automotive directories in South Africa like the Towing Directory, Auto Repair Directory and Fuel Directory. "),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: buildTextWidget(
                    "The company currently lists over 10 500 profiles receiving millions of profile visitors each month, and ambitious plans to further expand their reach into the African continent.  Web Directories is a reputable company that is committed to helping businesses succeed online. We provide businesses with the right tools to reach the right target audience and all our profiles are localized, optimized, and safely backed by advanced data security measures. Our team is dedicated to growing the South African economy, one listing at a time!"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextWidget(String text) {
    return SizedBox(
      height: MyUtility(context).height * 0.35,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'raleway',
          color: Color(0xFFF4F4F4),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
