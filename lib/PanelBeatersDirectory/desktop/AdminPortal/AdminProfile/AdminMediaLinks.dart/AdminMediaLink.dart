import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/AdminMediaLinks.dart/MediaLinkContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddMediaPopUp/AddMediaPopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/PopUpsCommon/NewDeletePopUp.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../ProfileComp/buttons/AddButton.dart';

class MediaLink {
  final String linkTitle;
  final String linkUrl;
  final int linksOrder;

  MediaLink({
    required this.linkTitle,
    required this.linkUrl,
    required this.linksOrder,
  });

  factory MediaLink.fromMap(Map<String, dynamic> map) {
    return MediaLink(
      linkTitle: map['linkTitle'],
      linkUrl: map['urlLink'],
      linksOrder: map['linksOrder'] is int
          ? map['linksOrder']
          : int.parse(
              map['linksOrder'] ?? '0'), // Handle string-to-int conversion
    );
  }
}

class AdminMediaLink extends StatefulWidget {
  Function getListingId;
  AdminMediaLink({super.key, required this.getListingId});

  @override
  State<AdminMediaLink> createState() => _AdminMediaLinkState();
}

class _AdminMediaLinkState extends State<AdminMediaLink> {
  final _firestore = FirebaseFirestore.instance;
  String searchText = "";
  List<MediaLink> _mediaList = [];

  @override
  void initState() {
    _fetchMediaData();
    super.initState();
  }

  Future<void> _fetchMediaData() async {
    _mediaList.clear();

    try {
      var listingId = await widget.getListingId();
      QuerySnapshot mediaDoc = await _firestore
          .collection('listings_links')
          .where('listingsId', isEqualTo: listingId)
          .get();

      if (mediaDoc.docs.isNotEmpty) {
        setState(() {
          _mediaList = mediaDoc.docs
              .map((docs) =>
                  MediaLink.fromMap(docs.data() as Map<String, dynamic>))
              .toList();
        });
        print('Fetched Media Data: $_mediaList'); // Debugging print
      } else {
        print('No media found'); // Debugging print
      }
    } catch (e) {
      print('Error fetching media data: $e'); // Debugging print
    }
  }

  Future<List<MediaLink>> getMediaData() async {
    try {
      var listingId = await widget.getListingId();
      QuerySnapshot mediaDoc = await _firestore
          .collection('listings_links')
          .where('listingsId', isEqualTo: listingId)
          .get();

      if (mediaDoc.docs.isNotEmpty) {
        print('Fetched Media Data: $_mediaList'); // Debugging print
        return mediaDoc.docs
            .map((docs) =>
                MediaLink.fromMap(docs.data() as Map<String, dynamic>))
            .toList();
      } else {
        print('No media found'); // Debugging print
        return [];
      }
    } catch (e) {
      print('Error fetching media data: $e'); // Debugging print
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20),
      child: Center(
        child: Container(
          width: MyUtility(context).width * 0.8,
          height: MyUtility(context).height,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.57, -0.82),
              end: Alignment(-0.57, 0.82),
              colors: [Color(0x19777777), Colors.white.withOpacity(0.4)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: Color(0xBF000000),
                blurRadius: 24,
                offset: Offset(0, 4),
                spreadRadius: -1,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: MyUtility(context).width * 0.9,
              height: MyUtility(context).height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AddButton(
                        text: 'Insert New Record',
                        onPressed: () {
                          // When adding new media, no existingTitle or existingUrl is passed
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black.withOpacity(0.5),
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.all(10),
                                child: AddMediaPopup(
                                  existingTitle: null, // No title for new media
                                  existingUrl: null, // No URL for new media
                                  documentId:
                                      null, // No document ID for new media
                                  onMediaAdded:
                                      _fetchMediaData, // Refresh after adding media
                                ),
                              );
                            },
                          );
                        },
                      ),
                      IconSearchBoxB(
                        onSearch: (String? value) {
                          setState(() {
                            searchText = value ?? '';
                          });
                        },
                        search: TextEditingController(),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 15),
                    child: Container(
                      width: MyUtility(context).width * 0.9,
                      height: MyUtility(context).height * 0.065,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MyUtility(context).width * 0.26,
                              child: Text(
                                'Media Type',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MyUtility(context).width * 0.46,
                              child: Text(
                                'Media Link',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.6064,
                                  fontFamily: 'ralewaybold',
                                ),
                              ),
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.6064,
                                fontFamily: 'ralewaybold',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MyUtility(context).height * 0.25,
                    child: FutureBuilder<List<MediaLink>>(
                      future: getMediaData(), // Fetch the media list
                      builder: (context, snapshot) {
                        // Check the state of the future
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Show a loading indicator while the data is being fetched
                          return Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white));
                        } else if (snapshot.hasError) {
                          // Handle errors during the fetch
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.isEmpty) {
                          // Handle the case where no data is returned
                          return Center(
                              child: Text('No media links found',
                                  style: TextStyle(color: Colors.grey)));
                        } else {
                          // Data successfully fetched
                          final mediaList =
                              snapshot.data!; // Access the fetched media list
                          final filteredMediaLinks =
                              mediaList.where((document) {
                            return [
                              document.linkTitle,
                              document.linkUrl,
                            ].any((value) =>
                                value.toLowerCase().contains(searchText));
                          }).toList();
                          return ListView.builder(
                            itemCount: filteredMediaLinks.length,
                            itemBuilder: (context, index) {
                              final media = filteredMediaLinks[index];

                              return Column(
                                children: [
                                  Visibility(
                                    visible: filteredMediaLinks.isEmpty &&
                                        index == 0,
                                    child: Center(
                                      child: Text(
                                        'No matching records found',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: filteredMediaLinks.isNotEmpty,
                                    child: MediaLinkContainer(
                                      mediaType: media.linkTitle,
                                      mediaLink: media.linkUrl,
                                      pressEdit: () async {
                                        // Fetch the document ID for the media being edited
                                        QuerySnapshot mediaDoc =
                                            await _firestore
                                                .collection('listings_links')
                                                .where('urlLink',
                                                    isEqualTo: media.linkUrl)
                                                .get();

                                        if (mediaDoc.docs.isNotEmpty) {
                                          String docId = mediaDoc.docs.first.id;

                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    EdgeInsets.all(10),
                                                child: AddMediaPopup(
                                                  existingTitle: media
                                                      .linkTitle, // Pass title for editing
                                                  existingUrl: media
                                                      .linkUrl, // Pass URL for editing
                                                  documentId:
                                                      docId, // Pass doc ID for editing
                                                  onMediaAdded:
                                                      _fetchMediaData, // Refresh after editing
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          print(
                                              'No document found for editing');
                                        }
                                      },
                                      isEven: index % 2 == 0,
                                      pressDelete: () async {
                                        // Fetch the document ID for the media being deleted
                                        QuerySnapshot mediaDoc =
                                            await _firestore
                                                .collection('listings_links')
                                                .where('urlLink',
                                                    isEqualTo: media.linkUrl)
                                                .get();

                                        if (mediaDoc.docs.isNotEmpty) {
                                          String docId = mediaDoc.docs.first.id;

                                          // Open the delete confirmation dialog
                                          showDialog(
                                            context: context,
                                            barrierDismissible: true,
                                            barrierColor:
                                                Colors.black.withOpacity(0.5),
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                insetPadding:
                                                    EdgeInsets.all(10),
                                                child: NewDeleteButton(
                                                  documentId: docId,
                                                  collectionName:
                                                      'listings_links',
                                                  refreshList: () {
                                                    setState(
                                                        () {}); // Refresh UI after deletion
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          print(
                                              'No document found for deletion');
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _deleteMedia(MediaLink media) async {
    try {
      QuerySnapshot mediaDoc = await _firestore
          .collection('listings_links')
          .where('urlLink', isEqualTo: media.linkUrl)
          .get();

      if (mediaDoc.docs.isNotEmpty) {
        await _firestore
            .collection('listings_links')
            .doc(mediaDoc.docs.first.id)
            .delete();
        _fetchMediaData(); // Refresh the list after deletion
        print('Media deleted: ${media.linkUrl}');
      } else {
        print('No media found for deletion');
      }
    } catch (e) {
      print('Error deleting media: $e');
    }
  }
}
