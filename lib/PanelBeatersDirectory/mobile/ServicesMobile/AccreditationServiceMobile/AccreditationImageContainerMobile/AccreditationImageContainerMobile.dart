import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

import 'AccreditationImageCompMobile/ImageBoxMobile.dart';

class AccreditationImageContainerMobile extends StatelessWidget {
  const AccreditationImageContainerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    final List<List<Widget>> imageColumns = List.generate(
      4,
      (columnIndex) => List.generate(6, (rowIndex) => ImageBox()),
    );

    return Container(
      width: MyUtility(context).width * 0.89,
      height: MyUtility(context).height * 0.5,
      decoration: ShapeDecoration(
        color: Color(0xFF181B1D),
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 4, 5),
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.all(4.0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: imageColumns.map((column) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: column.map((image) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 2, 5),
                      child: image,
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MyUtility(context).width * 0.2,
        height: MyUtility(context).height * 0.10,
        child: ImageBoxMobile());
  }
}
