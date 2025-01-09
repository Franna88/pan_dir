import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class LocationContainer extends StatefulWidget {
  final String businessImage;
  final String businessName;
  final String businessAddress;
  final VoidCallback OnPressed;
  final String views;
  final String distance;

  const LocationContainer(
      {Key? key,
      required this.businessImage,
      required this.businessName,
      required this.businessAddress,
      required this.OnPressed,
      required this.views,
      required this.distance})
      : super(key: key);

  @override
  State<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends State<LocationContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyUtility(context).height * 0.4,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            child: Container(
              width: MyUtility(context).width * 0.16,
              height: MyUtility(context).height * 0.3,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MyUtility(context).height * 0.1,
                  ),
                  Text(
                    widget.businessName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MyUtility(context).width * 0.0085,
                      fontFamily: 'ralewaysemi',
                      height: 0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: MyUtility(context).width * 0.15,
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
                    child: SizedBox(
                      width: MyUtility(context).width / 8.79,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MyUtility(context).height * 0.023,
                            width: MyUtility(context).width * 0.053,
                            child: ElevatedButton(
                              onPressed: widget.OnPressed,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                padding: EdgeInsets.all(0),
                                backgroundColor: Color(0xFFFF8728),
                              ),
                              child: Text(
                                'Navigate me',
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
                          Container(
                            height: MyUtility(context).height * 0.023,
                            width: MyUtility(context).width * 0.053,
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
                                'Navigate me',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MyUtility(context).width * 0.006,
                                  fontFamily: 'ralewayMedium',
                                  fontWeight: FontWeight.w500,
                                  height: 1.0, // Line height
                                ),
                              ),
                            ),
                          )
                        ],
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
                          'Vehicle Brand Approvals',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MyUtility(context).width * 0.006,
                            fontFamily: 'ralewayMedium',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Line height
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
                          'Insurance Approvals',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MyUtility(context).width * 0.006,
                            fontFamily: 'ralewayMedium',
                            fontWeight: FontWeight.w500,
                            height: 1.0, // Line height
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.04,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: MyUtility(context).width * 0.045,
                        child: Text(
                          'Distance:',
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
                        widget.distance,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MyUtility(context).width * 0.0093,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: MyUtility(context).width * 0.18,
              height: MyUtility(context).height * 0.164,
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
          ),
        ],
      ),
    );
  }
}
