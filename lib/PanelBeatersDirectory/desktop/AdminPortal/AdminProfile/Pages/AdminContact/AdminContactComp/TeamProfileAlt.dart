import 'package:cached_firestorage/lib.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/myutility.dart';

class TeamProfileAlt extends StatefulWidget {
  final String memberImage; // Image path or URL
  final String memberName;
  final String memberPosition;
  final VoidCallback editButton;
  final VoidCallback deleteButton;

  const TeamProfileAlt(
      {super.key,
      required this.memberImage,
      required this.memberName,
      required this.memberPosition,
      required this.editButton,
      required this.deleteButton});

  @override
  State<TeamProfileAlt> createState() => _TeamProfileAltState();
}

class _TeamProfileAltState extends State<TeamProfileAlt> {
  @override
  Widget build(BuildContext context) {
    // Full image path for the remote picture
    String imageUrl = "listings/${widget.memberImage}";

    var widthDevice = MediaQuery.of(context).size.width;

    return Container(
      width: MyUtility(context).width * 0.17,
      height: MyUtility(context).height * 0.31,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF121417),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFF121417),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "${widget.memberName} | ${widget.memberPosition}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widthDevice < 1500 ? 12.614 : 12.614,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: widget.editButton,
                    child: const Icon(
                      Icons.edit,
                      color: Color(0xFFD17226),
                      size: 18.0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.deleteButton();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Color(0xFFD17226),
                      size: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          /*  CircleAvatar(
            radius: widthDevice < 1500 ? 45 : 80,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: widthDevice < 1500 ? 43 : 80,
              backgroundColor: Colors.transparent,
              child: RemotePicture(
                imagePath: imageUrl,
                mapKey: 'background',
                fit: BoxFit.cover,
              ),
            ),
          ),*/

          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: RemotePicture(
              imagePath: imageUrl,
              mapKey: 'background',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
