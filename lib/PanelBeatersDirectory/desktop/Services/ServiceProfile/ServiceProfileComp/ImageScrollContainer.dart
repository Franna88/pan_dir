import 'dart:async';
import 'dart:typed_data';

import 'package:cached_firestorage/lib.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';

class ImageScrollContainer extends StatefulWidget {
  final List<String> images;
  const ImageScrollContainer({Key? key, required this.images})
      : super(key: key);

  @override
  _ImageScrollContainerState createState() => _ImageScrollContainerState();
}

class _ImageScrollContainerState extends State<ImageScrollContainer> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? Expanded(
            child: Center(
              child: Text('No images found for this listing',
                  style: TextStyle(color: Colors.white)),
            ),
          )
        : Column(
            children: [
              Container(
                width: MyUtility(context).width * 0.395,
                height: MyUtility(context).height * 0.565,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: Image.network(widget.images[_currentPage]).image,
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_currentPage > 0) {
                                  _currentPage--;
                                }
                              });
                            },
                            icon: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_currentPage < widget.images.length - 1) {
                                  _currentPage++;
                                }
                              });
                            },
                            icon: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: Center(
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
                  ],
                ),
              ),
              SizedBox(height: 10), // Add spacing between image and dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                  (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
