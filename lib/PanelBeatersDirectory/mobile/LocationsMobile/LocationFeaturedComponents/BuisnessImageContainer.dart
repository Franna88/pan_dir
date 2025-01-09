import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class BuisnessImageMobileContainer extends StatefulWidget {
  final String topImage;
  final String bottomImage;

  const BuisnessImageMobileContainer(
      {Key? key, required this.topImage, required this.bottomImage})
      : super(key: key);

  @override
  State<BuisnessImageMobileContainer> createState() =>
      _BuisnessImageMobileContainerState();
}

class _BuisnessImageMobileContainerState
    extends State<BuisnessImageMobileContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MyUtility(context).height * 0.45,
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            child: Container(
              width: MyUtility(context).width * 0.88,
              height: MyUtility(context).height * 0.35,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.bottomImage),
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
          Positioned(
            child: Container(
              width: MyUtility(context).width * 0.88,
              height: MyUtility(context).height * 0.15,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.topImage),
                  fit: BoxFit.cover,
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
