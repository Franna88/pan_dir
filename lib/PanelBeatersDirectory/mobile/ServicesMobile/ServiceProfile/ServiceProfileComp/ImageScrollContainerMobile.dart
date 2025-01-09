import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ImageScrollContainerMobile extends StatefulWidget {
  final List<String> images;
  ImageScrollContainerMobile({Key? key, required this.images})
      : super(key: key);

  @override
  _ImageScrollContainerMobileState createState() =>
      _ImageScrollContainerMobileState();
}

class _ImageScrollContainerMobileState
    extends State<ImageScrollContainerMobile> {
  int _currentPage = 0;

  @override
  void initState() {
    print(widget.images);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? Center(
            child: Text('No images found for this listing',
                style: TextStyle(color: Colors.white)),
          )
        : Container(
            width: MyUtility(context).width * 0.9,
            height: MyUtility(context).height * 0.3,
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
          );
  }
}
