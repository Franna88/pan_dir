import 'package:cached_firestorage/lib.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/TeamButton.dart';
import 'package:webdirectories/myutility.dart';

class GalleryContainer extends StatefulWidget {
  final String galleryImage;
  final String description;

  const GalleryContainer({
    super.key,
    required this.galleryImage,
    required this.description,
  });

  @override
  State<GalleryContainer> createState() => _GalleryContainerState();
}

class _GalleryContainerState extends State<GalleryContainer> {
  @override
  void initState() {
    print(widget.galleryImage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width * 0.15,
      height: MyUtility(context).height * 0.35,
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
            flex: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.network(
                    widget.galleryImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback widget in case of error
                      return Center(
                        child: SizedBox(
                            width: 200, child: const Icon(Icons.error)),
                      );
                    },
                  ),
                  // Positioned.fill(
                  //   child: RemotePicture(
                  //     imagePath: widget.galleryImage,
                  //     mapKey: 'background',
                  //     fit: BoxFit.cover,
                  //   ),

                  // ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Row(
                      children: [
                        TeamButton(
                          onPress: () {},
                          icon: 'images/edit.svg',
                        ),
                        TeamButton(
                          onPress: () {},
                          icon: 'images/delete.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 125,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF444444),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widthDevice < 1500 ? 13.6 : 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
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
