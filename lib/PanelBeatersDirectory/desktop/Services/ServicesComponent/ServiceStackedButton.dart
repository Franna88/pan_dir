import 'package:flutter/material.dart';

class ServicesStackedButton extends StatefulWidget {
  final bool? isComingSoon;
  final VoidCallback toggleFeatured;
  final bool isFeaturedSelected;

  const ServicesStackedButton(
      {Key? key,
      this.isComingSoon,
      required this.toggleFeatured,
      required this.isFeaturedSelected})
      : super(key: key);

  @override
  _ServicesStackedButtonState createState() => _ServicesStackedButtonState();
}

class _ServicesStackedButtonState extends State<ServicesStackedButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.isComingSoon != null && widget.isComingSoon!
          ? SystemMouseCursors.forbidden
          : SystemMouseCursors.click,
      onEnter: (_) {
        if (widget.isComingSoon != null && widget.isComingSoon!) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(children: [
        SizedBox(
          width: 300,
          height: 50,
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 110,
                child: ElevatedButton(
                  onPressed: () {
                    widget.toggleFeatured();
                    // setState(() {
                    //   widget.isFeaturedSelected = false;
                    // });
                    //widget.showOther();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isFeaturedSelected
                        ? Colors.black
                        : Color(0xFFFF8728),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fixedSize: Size(126, 40),
                  ),
                  child: Text(
                    'Other',
                    style: TextStyle(
                      color: widget.isFeaturedSelected
                          ? Colors.white
                          : Colors.black,
                      fontSize: 20.4,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 0,
                child: ElevatedButton(
                  onPressed: () {
                    widget.toggleFeatured();
                    // setState(() {
                    //   isFeaturedSelected = true;
                    // });
                    // widget.showFeatured();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.isFeaturedSelected
                        ? Color(0xFFFF8728)
                        : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fixedSize: Size(140, 40),
                  ),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      color: widget.isFeaturedSelected
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20.4,
                      fontFamily: 'raleway',
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
