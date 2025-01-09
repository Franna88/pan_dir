import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class LocationMobileOtherContainer extends StatefulWidget {
  final String businessImage;
  final String businessName;
  final String businessAddress;
  final VoidCallback OnPressed;
  final String views;

  const LocationMobileOtherContainer({
    Key? key,
    required this.businessImage,
    required this.businessName,
    required this.businessAddress,
    required this.OnPressed,
    required this.views,
  }) : super(key: key);

  @override
  State<LocationMobileOtherContainer> createState() =>
      _LocationMobileOtherContainerState();
}

class _LocationMobileOtherContainerState
    extends State<LocationMobileOtherContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: MyUtility(context).width * 0.89,
        height: MyUtility(context).height * 0.32,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MyUtility(context).width * 0.89,
              height: MyUtility(context).height * 0.135,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.businessImage),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Text(
              widget.businessName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.3464,
                fontFamily: 'ralewaysemi',
                height: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                width: MyUtility(context).width * 0.75,
                child: Text(
                  widget.businessAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.02,
                    fontFamily: 'ralewaymedium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MyUtility(context).height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                height: MyUtility(context).height * 0.0325,
                width: MyUtility(context).width * 0.65,
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
                      fontSize: 14.03,
                      fontFamily: 'ralewayMedium',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                height: MyUtility(context).height * 0.0325,
                width: MyUtility(context).width * 0.65,
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
                      fontSize: 14.03,
                      fontFamily: 'ralewayMedium',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MyUtility(context).width * 0.22,
                  child: Text(
                    'Views:',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.19,
                      fontFamily: 'ralewaybold',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  widget.views,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.19,
                    fontFamily: 'raleway',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
