import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webdirectories/myutility.dart';

class PartnerMobileContainer extends StatefulWidget {
  final String image;
  final String header;
  final String description;

  const PartnerMobileContainer(
      {Key? key,
      required this.image,
      required this.header,
      required this.description})
      : super(key: key);

  @override
  State<PartnerMobileContainer> createState() => _PartnerMobileContainerState();
}

class _PartnerMobileContainerState extends State<PartnerMobileContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MyUtility(context).width / 1.15,
        height: MyUtility(context).height * 0.5,
        decoration: BoxDecoration(
          color: Color(0xFFebebeb).withOpacity(0.8),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: MyUtility(context).height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: SvgPicture.asset(
                      widget.image,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MyUtility(context).width / 1.3,
              child: Text(
                widget.header,
                style: TextStyle(fontSize: 24, fontFamily: 'ralewaysemi'),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MyUtility(context).width / 1.3,
                child: Text(
                  widget.description,
                  style: TextStyle(fontSize: 18, fontFamily: 'raleway'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
