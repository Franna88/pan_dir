import 'package:flutter/material.dart';

import 'CommonColor.dart';

class OwnersMessageFeatures extends StatefulWidget {
  final String? imagePath;
  final String? title;
  final String? description;
  const OwnersMessageFeatures({
    super.key,
    this.imagePath,
    this.title,
    this.description,
  });

  @override
  State<OwnersMessageFeatures> createState() => _OwnersMessageFeaturesState();
}

class _OwnersMessageFeaturesState extends State<OwnersMessageFeatures> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 500,
            height: 300,
            child: Column(
              children: [
                if (widget.imagePath != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      widget.imagePath!,
                      fit: BoxFit.contain,
                    ),
                  ),
                if (widget.title != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title!,
                      style: TextStyle(
                        fontFamily: 'ralewaybold',
                        fontSize: 29.2,
                        color: CommonColor().Colors5,
                      ),
                    ),
                  ),
                if (widget.description != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.description!,
                      style: TextStyle(
                        fontSize: 17.64,
                        color: CommonColor().Colors5,
                        fontFamily: 'raleway',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
