import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class ServicesOtherContainer extends StatefulWidget {
  final String businessImage;
  final String businessName;
  final String businessAddress;
  final VoidCallback OnPressed;
  final String views;

  const ServicesOtherContainer({
    Key? key,
    required this.businessImage,
    required this.businessName,
    required this.businessAddress,
    required this.OnPressed,
    required this.views,
  }) : super(key: key);

  @override
  State<ServicesOtherContainer> createState() => _ServicesOtherContainerState();
}

class _ServicesOtherContainerState extends State<ServicesOtherContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.16,
      height: MyUtility(context).height * 0.265,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: AspectRatio(
              aspectRatio: 2.5 / 1,
              child: Image.asset(
                widget.businessImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            widget.businessName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: MyUtility(context).width * 0.0083,
              fontFamily: 'ralewaysemi',
              height: 0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              width: 208.08,
              child: Text(
                widget.businessAddress,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MyUtility(context).width * 0.006,
                  fontFamily: 'ralewaymedium',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: MyUtility(context).height * 0.023,
              width: MyUtility(context).width * 0.115,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0xFFFF8728),
                ),
                child: Text(
                  'Send Message',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MyUtility(context).width * 0.006,
                    fontFamily: 'ralewayMedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              height: MyUtility(context).height * 0.023,
              width: MyUtility(context).width * 0.115,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.all(0),
                  backgroundColor: Color(0xFF0E1013),
                ),
                child: Text(
                  'See Reviews',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MyUtility(context).width * 0.006,
                    fontFamily: 'ralewayMedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MyUtility(context).width * 0.035,
                child: Text(
                  'Views:',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MyUtility(context).width * 0.0093,
                    fontFamily: 'ralewaybold',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Text(
                widget.views,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: MyUtility(context).width * 0.0093,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
