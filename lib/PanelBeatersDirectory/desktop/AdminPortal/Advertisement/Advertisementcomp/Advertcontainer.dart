import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/Advertisement/Advertisementcomp/AdvertEdit.dart';

import 'package:webdirectories/myutility.dart';

class Advertcontainer extends StatefulWidget {
  final String? memberImage;
  final String memberName;

  const Advertcontainer({
    super.key,
    required this.memberImage,
    required this.memberName,
  });

  @override
  State<Advertcontainer> createState() => _AdvertcontainerState();
}

class _AdvertcontainerState extends State<Advertcontainer> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width * 0.15,
      height: MyUtility(context).height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xFF212529),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 175,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: widget.memberImage != null
                  ? Image.network(
                      widget.memberImage!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => SizedBox(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    )
                  : Center(
                      child: Icon(Icons.error),
                    ),
            ),
          ),
          Expanded(
            flex: 125,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Text(
                        widget.memberName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: widthDevice < 1500 ? 13.6 : 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AdvertEdit(
                          onPress: () {},
                          icon: 'images/edit.svg',
                        ),
                        AdvertEdit(
                          onPress: () {},
                          icon: 'images/delete.svg',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
