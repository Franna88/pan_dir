import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExploreOptionsContainer extends StatefulWidget {
  String assetName;
  String mainTitle;
  String description;
  String buttonText;

  ExploreOptionsContainer(
      {super.key,
      required this.assetName,
      required this.description,
      required this.mainTitle,
      required this.buttonText});

  @override
  State<ExploreOptionsContainer> createState() =>
      _ExploreOptionsContainerState();
}

class _ExploreOptionsContainerState extends State<ExploreOptionsContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      height: heightDevice * 0.35,
      width: widthDevice * 0.30,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(widget.assetName), fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.mainTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: widthDevice / 50,
                fontFamily: 'ralewaybold',
                fontWeight: FontWeight.w700,
                height: 1
              ),
            ),
            SizedBox(
              height: heightDevice * 0.03,
            ),
            Text(
              widget.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: widthDevice / 85,
                fontFamily: 'raleway',
                fontWeight: FontWeight.w400,
              ),
            ),
            
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  onEnter: (_) {
                    setState(() {
                      isHovered = true;
                    });
                  },
                  onExit: (_) {
                    setState(() {
                      isHovered = false;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    /*width: MediaQuery.of(context).size.width * 0.08,*/
                    /*height: MediaQuery.of(context).size.height * 0.05,*/
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isHovered ? Colors.black : Color(0xFFE2822B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 8, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.buttonText,
                              style: TextStyle(
                                color: isHovered ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontFamily: 'ralewaymedium',
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.east,
                              color: isHovered ? Colors.white : Colors.black,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
