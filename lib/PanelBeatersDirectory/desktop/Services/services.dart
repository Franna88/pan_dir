import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:seo/head_tag.dart';
import 'package:seo/html/seo_widget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Footer/panelFooter.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AboutServices/AboutServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/AccreditationService/AccreditationService.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/DocumentsServices.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Finance/Finance.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/Reviews/Reviews.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceContact/ServiceContact.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServiceProfile/ServiceProfile.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesMaps/ServicesMaps.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/ServicesNavButton/ServicesNavButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';
import 'package:webdirectories/myutility.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;

enum ServicesPages {
  profile,
  contact,
  maps,
  accreditation,
  about,
  documents,
  reviews,
  finance
}

class Services extends StatefulWidget {
  final ServicesPages? page;
  final String listingId;
  const Services({super.key, required this.listingId, this.page});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, dynamic> _listingData = {};
  String _listingsTitle = '';
  List<String> _galleryData = [];
  Map<String, String> _linkData = {};
  Map<String, String> _contactData = {};
  bool? _isLoading;
  var pageIndex = 0;
  List businessViews = [];

  @override
  void initState() {
    super.initState();
    if (widget.page != null) {
      switch (widget.page!) {
        case ServicesPages.profile:
          pageIndex = 0;
          break;
        case ServicesPages.contact:
          pageIndex = 1;
          break;
        case ServicesPages.maps:
          pageIndex = 2;
          break;
        case ServicesPages.accreditation:
          pageIndex = 3;
          break;
        case ServicesPages.about:
          pageIndex = 4;
          break;
        case ServicesPages.documents:
          pageIndex = 5;
          break;
        case ServicesPages.reviews:
          pageIndex = 6;
          break;
        case ServicesPages.finance:
          pageIndex = 7;
          break;
      }
    }
    checkViewExist();
    _getListingData();
  }

  ///change page
  updatePageIndex(value) {
    setState(() {
      pageIndex = value;
    });
  }

//check if business in view list and view
  checkViewExist() async {
    var busnessDetails = {
      'listingId': widget.listingId,
      'views': [],
    };
    final ipv4 = await Ipify.ipv4();

    final DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('views')
        .doc(widget.listingId)
        .get();
    if (doc.exists) {
      checkAndUpdateBusinessViews(doc.data() as Map<String, dynamic>, ipv4);
    } else {
      //create business listing
      FirebaseFirestore.instance
          .collection('views')
          .doc(widget.listingId)
          .set(busnessDetails)
          .whenComplete(updateViews(ipv4));
    }
  }

  void checkAndUpdateBusinessViews(Map<String, dynamic> doc, String ipv4) {
    try {
      // Extract views and filter by IP address
      List<Map<String, dynamic>> views = (doc['views'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .where((view) => view['ip'] == ipv4)
          .toList();

      if (views.isEmpty) {
        print("No existing views for this IP.");
        updateViews(ipv4); // Add a new view if no records exist
        return;
      }

      // Find the most recent record by date
      Map<String, dynamic> mostRecentRecord = views.reduce((a, b) =>
          (a['date'] as Timestamp)
                  .toDate()
                  .isAfter((b['date'] as Timestamp).toDate())
              ? a
              : b);

      DateTime dateViewAdded = (mostRecentRecord['date'] as Timestamp).toDate();
      DateTime todayDate = DateTime.now();

      // Calculate difference in days
      int daysDifference = todayDate.difference(dateViewAdded).inDays;

      if (daysDifference >= 1) {
        print("ADD");
        updateViews(
            ipv4); // Add a new view if the last record is older than a day
      } else {
        print("View already exists within the past day.");
      }
    } catch (e) {
      print("Error checking and updating views: $e");
    }
  }

//Update businessViews
  updateViews(ip) async {
    final currentUrl = html.window.location.href;
    var viewDetails = {"ip": ip, "url": currentUrl, "date": DateTime.now()};
    setState(() {
      businessViews.add(viewDetails);
    });

    FirebaseFirestore.instance
        .collection('views')
        .doc(widget.listingId)
        .update({"views": businessViews});
  }

  Future<void> _getListingData() async {
    print('listing id: ${widget.listingId}');
    try {
      setState(() {
        _isLoading = true;
      });

      QuerySnapshot data = await _firestore
          .collection('listings')
          .where('listingsId', isEqualTo: int.parse(widget.listingId))
          .get();

      if (data.docs.isNotEmpty) {
        print('getting data...');
        Map<String, dynamic> listingData =
            data.docs.first.data() as Map<String, dynamic>;

        // Fetch images
        QuerySnapshot imagesSnapshot = await _firestore
            .collection('gallery')
            .where('listingsId', isEqualTo: int.parse(widget.listingId))
            .get();
        List<Map<String, dynamic>> images = imagesSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();

        List<String> urls = [];

        for (var element in images) {
          if ((element['immageFile'] as String).contains('firebase')) {
            urls.add(element['immageFile']);
          }

          // String? url = await getImageUrl('listings/${element['immageFile']}');
          // if (url != null) {
          //   urls.add(url);
          // }
        }

        int viewCount = await _firestore
            .collection('views')
            .doc(widget.listingId)
            .get()
            .then((snapshot) => snapshot['views'].length)
            .catchError((error) => 0);

        // Set state
        setState(() {
          _galleryData = urls;
          _listingData = data.docs.first.data() as Map<String, dynamic>;
          _listingsTitle = listingData['title'];
          _linkData = Map<String, String>.from({
            'telephone': listingData['businessTelephone'],
            'email': listingData['businessEmail'],
            'whatsapp': listingData['whatsappNumber'],
            'streetaddress': listingData['streetaddress'],
            'listingsId': widget.listingId
          });
          _contactData = Map<String, String>.from({
            'telephone': listingData['businessTelephone'],
            'address': listingData['streetaddress'],
            'views': viewCount.toString(),
          });
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching listing data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> servicesPages = [
      Seo.head(
        tags: [
          MetaTag(
            name: 'description',
            content: 'Panel Beaters Directory - ${_listingsTitle}',
          ),
          LinkTag(
            rel: 'canonical',
            href:
                'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
          ),
        ],
        child: ServiceProfile(
            imagesData: _galleryData,
            linkData: _linkData,
            contactData: _contactData,
            updatePageIndex: updatePageIndex),
      ),
      Seo.head(
        tags: [
          MetaTag(
            name: 'description',
            content: 'Panel Beaters Directory - ${_listingsTitle}',
          ),
          LinkTag(
            rel: 'canonical',
            href:
                'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
          ),
        ],
        child: ServiceContact(
          listingData: _listingData,
        ),
      ),
      Seo.head(
        tags: [
          MetaTag(
            name: 'description',
            content: 'Panel Beaters Directory - ${_listingsTitle}',
          ),
          LinkTag(
            rel: 'canonical',
            href:
                'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
          ),
        ],
        child: ServicesMaps(
          listingId: _listingData['listingsId'] ?? 0,
          listingAddress: _listingData['streetaddress'] ?? 'No listing address',
          listinglatitude: _listingData['latitude'] ?? 0.0,
          listinglongitude: _listingData['longitude'] ?? 0.0,
        ),
      ),
      Seo.head(tags: [
        MetaTag(
          name: 'description',
          content: 'Panel Beaters Directory - ${_listingsTitle}',
        ),
        LinkTag(
          rel: 'canonical',
          href:
              'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
        ),
      ], child: AccreditationServices(listingId: int.parse(widget.listingId))),
      Seo.head(
        tags: [
          MetaTag(
            name: 'description',
            content: 'Panel Beaters Directory - ${_listingsTitle}',
          ),
          LinkTag(
            rel: 'canonical',
            href:
                'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
          ),
        ],
        child: AboutServices(
            listingsId: int.parse(widget.listingId),
            beeLevel: _listingData['beerating'] ?? ''),
      ),
      Seo.head(tags: [
        MetaTag(
          name: 'description',
          content: 'Panel Beaters Directory - ${_listingsTitle}',
        ),
        LinkTag(
          rel: 'canonical',
          href:
              'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
        ),
      ], child: DocumentsServices(listingsId: int.parse(widget.listingId))),
      Seo.head(tags: [
        MetaTag(
          name: 'description',
          content: 'Panel Beaters Directory - ${_listingsTitle}',
        ),
        LinkTag(
          rel: 'canonical',
          href:
              'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
        ),
      ], child: Reviews()),
      Seo.head(tags: [
        MetaTag(
          name: 'description',
          content: 'Panel Beaters Directory - ${_listingsTitle}',
        ),
        LinkTag(
          rel: 'canonical',
          href:
              'https://webdirectories.co.za/panelbeaters/listings/${widget.listingId}',
        ),
      ], child: Finance()),
    ];
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MyUtility(context).width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/mainbackgroundPanel.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: SizedBox(
                            width: MyUtility(context).width * 0.88,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  'images/panelLogo.png',
                                  // height: 70,
                                  width: MyUtility(context).width * 0.23,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(1),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.keyboard_arrow_left,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Go Back',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.68,
                                              fontFamily: 'raleway',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: _isLoading == true
                              ? SizedBox(
                                  height: MyUtility(context).height * 0.8,
                                  child: const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white)))
                              : Container(
                                  width: MyUtility(context).width * 0.88,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: const Alignment(-0.57, -0.83),
                                      end: const Alignment(0.56, 0.83),
                                      colors: [
                                        Colors.white.withOpacity(0.1),
                                        Colors.white.withOpacity(0.25),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0xBF000000),
                                        blurRadius: 24,
                                        offset: Offset(0, 4),
                                        spreadRadius: -1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      _listingsTitle == null
                                          ? const CircularProgressIndicator(
                                              color: Colors.white)
                                          : ServicesNavButton(
                                              listingTitle: _listingsTitle!,
                                              updatePageIndex: updatePageIndex),
                                      servicesPages[pageIndex],
                                    ],
                                  ),
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
            const PanelFooter(),
          ],
        ),
      ),
    );
  }
}
