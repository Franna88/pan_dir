import 'package:cached_firestorage/lib.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/GalaryAltContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/GalleryContainer.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Gallery/GalleryComp/PageChangeButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/AddButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/CommonReuseable/IconSearchBoxB.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/PopUps/AddImagePopup/AddImagepopup.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/storedUser.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/loginUtils.dart';
import 'package:webdirectories/myutility.dart';

import '../../../../PopUps/PopUpsCommon/NewDeletePopUp.dart';

class GalleryAlt extends StatefulWidget {
  Function getListingId;
  GalleryAlt({super.key, required this.getListingId});

  @override
  State<GalleryAlt> createState() => _GalleryAltState();
}

class _GalleryAltState extends State<GalleryAlt> {
  List<Map<String, dynamic>> galleryItems = [];
  final _firestore = FirebaseFirestore.instance;
  bool _isLoading = true;
  String searchText = "";

  @override
  void initState() {
    super.initState();
    _loadGalleryData();
  }

  // Fetch the gallery data only once and store it locally
  Future<void> _loadGalleryData() async {
    try {
      var userId = await widget.getListingId();
      QuerySnapshot gallerySnapshot = await _firestore
          .collection('gallery')
          .where('listingsId', isEqualTo: userId)
          .get();

      if (gallerySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> processedData = [];
        for (var doc in gallerySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          String fileName = data['immageFile'];
          // String? url = await getImageUrl('listings/$fileName');

          // if (url != null) {
          //   data['immageFile'] = url;
          // }

          processedData
              .add({...data, 'docId': doc.id}); // Add docId for updating
        }

        setState(() {
          galleryItems = processedData;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching gallery data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Function to handle adding or editing images
  void _showImagePopup({Map<String, dynamic>? existingImage}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.all(10),
          child: AddImagePopup(
            onImageUpload: (Map<String, dynamic> image) {
              setState(() {
                if (existingImage == null) {
                  // Add new image
                  galleryItems.add(image);
                } else {
                  // Update existing image
                  int index = galleryItems.indexWhere(
                      (item) => item['docId'] == existingImage['docId']);
                  if (index != -1) {
                    galleryItems[index] = image;
                  }
                }
                _loadGalleryData();
              });
            },
            existingImage: existingImage, // Pass the existing image if editing
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> get _filteredGalleryItems => galleryItems
      .where((element) => element['immageTitle']
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.5, top: 12.5, left: 20),
              child: Text(
                'Image limit: 12 images, max 2 Megabytes each. Prefer landscape format. Accepted file types: JPG, JPEG, PNG, GIF.',
                style: TextStyle(
                  color: Color(0xFFD17226),
                  fontSize: 13.7364,
                  fontFamily: 'ralewaysemi',
                ),
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AddButton(
                          text: 'Add Image',
                          onPressed: () {
                            _showImagePopup(); // Call without existingImage for adding new image
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Drag and drop to reorder list!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.6064,
                            fontFamily: 'raleway',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
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
                      ],
                    ),
                    SizedBox(height: 25),
                    _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : galleryItems.isEmpty
                            ? const Center(
                                child: Text(
                                  'No images found',
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            : Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 4.0,
                                    crossAxisSpacing: 4.0,
                                    childAspectRatio: 4 / 4,
                                  ),
                                  itemCount: _filteredGalleryItems.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> image =
                                        _filteredGalleryItems[index];
                                    return Column(
                                      children: [
                                        Visibility(
                                          visible:
                                              _filteredGalleryItems.isEmpty &&
                                                  index == 0,
                                          child: Center(
                                            child: Text(
                                              'No matching records found',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              _filteredGalleryItems.isNotEmpty,
                                          child:
                                              Draggable<Map<String, dynamic>>(
                                            data: image,
                                            feedback: Material(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.orange,
                                                      width: 1),
                                                ),
                                                child: GalleryAltContainer(
                                                  galleryImage:
                                                      image['immageFile'],
                                                  description:
                                                      image['immageTitle'],
                                                  editButton: () {
                                                    _showImagePopup(
                                                        existingImage:
                                                            image); // Pass existingImage for editing
                                                  },
                                                  deleteButton: () {},
                                                ),
                                              ),
                                            ),
                                            childWhenDragging: Opacity(
                                              opacity: 0.3,
                                              child: GalleryAltContainer(
                                                galleryImage:
                                                    image['immageFile'],
                                                description:
                                                    image['immageTitle'],
                                                editButton: () {
                                                  _showImagePopup(
                                                      existingImage:
                                                          image); // Pass existingImage for editing
                                                },
                                                deleteButton: () {},
                                              ),
                                            ),
                                            child: DragTarget<
                                                Map<String, dynamic>>(
                                              onAccept: (draggedImage) {
                                                setState(() {
                                                  int oldIndex = galleryItems
                                                      .indexOf(draggedImage);
                                                  int newIndex = galleryItems
                                                      .indexOf(image);

                                                  if (oldIndex != newIndex) {
                                                    galleryItems
                                                        .removeAt(oldIndex);
                                                    galleryItems.insert(
                                                        newIndex, draggedImage);
                                                  }
                                                });
                                              },
                                              builder: (BuildContext context,
                                                  List<Map<String, dynamic>?>
                                                      candidateData,
                                                  rejectedData) {
                                                return GalleryAltContainer(
                                                  galleryImage:
                                                      image['immageFile'],
                                                  description:
                                                      image['immageTitle'],
                                                  editButton: () {
                                                    _showImagePopup(
                                                        existingImage:
                                                            image); // Pass existingImage for editing
                                                  },
                                                  deleteButton: () {
                                                    showDialog(
                                                      context: context,
                                                      barrierDismissible: true,
                                                      barrierColor: Colors.black
                                                          .withOpacity(0.5),
                                                      builder: (BuildContext
                                                          context) {
                                                        return Dialog(
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          insetPadding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child:
                                                              NewDeleteButton(
                                                            documentId:
                                                                image['docId'],
                                                            collectionName:
                                                                'gallery',
                                                            refreshList: () {
                                                              _loadGalleryData();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
