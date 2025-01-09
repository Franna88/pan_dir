import 'package:cached_firestorage/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class ServiceFeaturedContainer extends StatefulWidget {
  final String businessImage;
  final String businessName;
  final String businessAddress;
  final VoidCallback OnPressed;
  final VoidCallback navigateMe;
  final String views;
  final String? distance;

  const ServiceFeaturedContainer(
      {Key? key,
      required this.businessImage,
      required this.businessName,
      required this.businessAddress,
      required this.OnPressed,
      required this.navigateMe,
      required this.views,
      required this.distance})
      : super(key: key);

  @override
  State<ServiceFeaturedContainer> createState() =>
      _ServiceFeaturedContainerState();
}

class _ServiceFeaturedContainerState extends State<ServiceFeaturedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.16,
      height: MyUtility(context).height * 0.36,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: AspectRatio(
                aspectRatio: 2.2 / 1,
                child: Image.network(
                  widget.businessImage,
                  fit: BoxFit
                      .fill, // This ensures the image covers the entire aspect ratio area
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Text('Error loading image'));
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              
              widget.businessName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: MyUtility(context).width * 0.0085,
                fontFamily: 'ralewaysemi',

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: SizedBox(
              width: 208.08,
              height: 45,
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
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Container(
                height: 17.5,
                width: 157.76,
                child: ElevatedButton(
                  onPressed: () {
                    widget.OnPressed();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.all(0),
                    backgroundColor: Color(0xFFFF8728),
                  ),
                  child: Text(
                    'View Profile',
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Container(
              height: 18,
              width: 157.76,
              child: ElevatedButton(
                onPressed: () {
                  widget.navigateMe();
                },
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
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MyUtility(context).width * 0.05,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
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
                        widget.distance != null
                            ? Text(
                                'Distance:',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MyUtility(context).width * 0.0093,
                                  fontFamily: 'ralewaybold',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
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
                      widget.distance != null
                          ? Text(
                              widget.distance!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MyUtility(context).width * 0.0093,
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
