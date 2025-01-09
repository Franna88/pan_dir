import 'package:cached_firestorage/lib.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/TeamButton.dart';
import 'package:webdirectories/myutility.dart';

class TeamProfile extends StatefulWidget {
  final String memberImage;
  final String memberName;
  final String memberPosition;

  const TeamProfile(
      {super.key,
      required this.memberImage,
      required this.memberName,
      required this.memberPosition});

  @override
  State<TeamProfile> createState() => _TeamProfileState();
}

class _TeamProfileState extends State<TeamProfile> {
  @override
  Widget build(BuildContext context) {
    String imageUrl = widget.memberImage != ''
        ? "listings/images/team/${widget.memberImage}"
        : "";

    var widthDevice = MediaQuery.of(context).size.width;
    return Container(
      width: MyUtility(context).width * 0.15,
      height: 1000,
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
              flex: 225,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: imageUrl == ""
                          ? Image.asset(
                              'images/employee.jpg',
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback widget in case of error
                                return const Icon(Icons.picture_in_picture);
                              },
                              fit: BoxFit.cover,
                            )
                          : RemotePicture(
                              imagePath: imageUrl,
                              mapKey: 'background',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 225,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5, top: 5),
                      child: Text(
                        widget.memberName,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: widthDevice < 1500 ? 13.6 : 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        widget.memberPosition,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: widthDevice < 1500 ? 13.6 : 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
