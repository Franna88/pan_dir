import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class ReviewsNAvButtonMobile extends StatefulWidget {
  Function(int) changePageIndex;
  int pageIndex;

  ReviewsNAvButtonMobile(
      {super.key, required this.changePageIndex, required this.pageIndex});

  @override
  State<ReviewsNAvButtonMobile> createState() => _ReviewsNAvButtonMobileState();
}

class _ReviewsNAvButtonMobileState extends State<ReviewsNAvButtonMobile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyUtility(context).width * 0.9,
      height: MyUtility(context).height * 0.052,
      child: Stack(
        children: [
          Positioned(
            top: 07,
            left: 40,
            child: ElevatedButton(
              onPressed: () {
                widget.changePageIndex(1);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.pageIndex == 1
                    ? Color(0xFFFF8828)
                    : Color(0x3FFC40D0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                fixedSize: Size(MyUtility(context).width * 0.74,
                    MyUtility(context).height * 0.055),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Lightstone EchoMBR Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MyUtility(context).width * 0.034,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 07,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                widget.changePageIndex(0);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.pageIndex == 0
                    ? Color(0xFFFF8828)
                    : Color(0x3FFC40D0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                  ),
                ),
                fixedSize: Size(MyUtility(context).width * 0.3,
                    MyUtility(context).height * 0.055),
                padding: EdgeInsets.only(right: -10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Text(
                  'Shop Reviews',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MyUtility(context).width * 0.034,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
