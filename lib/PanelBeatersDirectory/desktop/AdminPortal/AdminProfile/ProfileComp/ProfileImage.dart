import 'dart:typed_data';
import 'package:cached_firestorage/lib.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';

class ProfileImage extends StatefulWidget {
  final String imageText;
  final String imageName;
  final VoidCallback imageChange;

  const ProfileImage(
      {super.key,
      required this.imageName,
      required this.imageText,
      required this.imageChange});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    setState(() {
      _imageUrl = widget.imageName == '' ? '' : "listings/${widget.imageName}";
    });
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              widget.imageText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.7364,
                fontFamily: 'raleway',
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: widget.imageChange,
            child: Container(
              width: widthDevice < 1500
                  ? MyUtility(context).width * 0.3
                  : MyUtility(context).width * 0.22,
              height: MyUtility(context).height * 0.27,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: widget.imageName == ''
                      ? const Text('No Image')
                      : RemotePicture(
                          imagePath: _imageUrl!,
                          mapKey: widget.imageName,
                          useAvatarView: false,
                          fit: BoxFit.fill,
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
