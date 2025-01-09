import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class GalleryAltContainer extends StatefulWidget {
  final String galleryImage;
  final String description;
  final VoidCallback editButton;
  final VoidCallback deleteButton;

  const GalleryAltContainer(
      {super.key,
      required this.galleryImage,
      required this.description,
      required this.editButton,
      required this.deleteButton});

  @override
  State<GalleryAltContainer> createState() => _GalleryAltContainerState();
}

class _GalleryAltContainerState extends State<GalleryAltContainer> {
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
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFF212529),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color: Color(0xFF171616),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widthDevice < 1500 ? 12.614 : 12.614,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: widget.editButton,
                        child: Icon(
                          Icons.edit,
                          color: Color(0xFFD17226), // Orange color for icons
                          size: 18.0,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          widget.deleteButton();
                        },
                        child: Icon(
                          Icons.delete,
                          color: Color(0xFFD17226), // Orange color for icons
                          size: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Image filling the remaining space
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              child: Image.network(
                widget.galleryImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
