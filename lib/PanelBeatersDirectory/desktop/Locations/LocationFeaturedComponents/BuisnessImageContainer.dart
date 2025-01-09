import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webdirectories/myutility.dart';

class BuisnessImageContainer extends StatefulWidget {
  final String topImage;
  final String bottomImage;

  const BuisnessImageContainer(
      {Key? key, required this.topImage, required this.bottomImage})
      : super(key: key);

  @override
  State<BuisnessImageContainer> createState() => _BuisnessImageContainerState();
}

class _BuisnessImageContainerState extends State<BuisnessImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.16,
      height: MyUtility(context).height * 0.36,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: SizedBox(
        height: MyUtility(context).height * 0.36,
        width: MyUtility(context).width * 0.17,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 2.2 / 1,
                child: Image.asset(
                  widget.topImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 2.2 / 1,
                  child: Image.asset(
                    widget.bottomImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
