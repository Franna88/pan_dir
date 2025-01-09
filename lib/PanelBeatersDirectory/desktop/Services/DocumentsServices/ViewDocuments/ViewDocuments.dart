import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/ViewDocuments/ViewDocumentscomp/DocumentButton.dart';
import 'package:webdirectories/myutility.dart';

class ViewDocuments extends StatefulWidget {
  final int id;
  const ViewDocuments({Key? key, required this.id}) : super(key: key);

  @override
  State<ViewDocuments> createState() => _ViewDocumentsState();
}

class _ViewDocumentsState extends State<ViewDocuments> {
  late ScrollController _scrollController;
  int? selectedIndex;
  final _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _documentData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _fetchDocuments();
  }

  Future<void> _fetchDocuments() async {
    try {
      QuerySnapshot documentsSnapshot = await _firestore
          .collection('listings_documents')
          .where('listingsId', isEqualTo: widget.id)
          .get();

      if (documentsSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> documentsData = documentsSnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
        setState(() {
          _documentData = documentsData;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching documents: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleDocumentSelection(int index) {
    setState(() {
      if (selectedIndex == index) {
        selectedIndex = null;
      } else {
        selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MyUtility(context).width * 0.85,
      height: MyUtility(context).height * 0.71,
      decoration: BoxDecoration(
          color: const Color(0xFF181B1D),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DraggableScrollbar.rrect(
          controller: _scrollController,
          backgroundColor: Color(0x7FD9D9D9),
          alwaysVisibleScrollThumb: true,
          child: ListView(
            controller: _scrollController,
            shrinkWrap: true,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 1065,
                      child: _isLoading
                          ? SizedBox(
                              height: MyUtility(context).height * 0.8,
                              child: Center(
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'View Available Documents:',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 20.4,
                                    fontFamily: 'raleway',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  ..._documentData
                      .map((doc) => DocumentButton(
                            documentText: doc['documentTitle'],
                            isSelected:
                                selectedIndex == _documentData.indexOf(doc),
                            onPressedDownload: () {},
                            onPressPreview: () {},
                            onTap: () {
                              _handleDocumentSelection(
                                  _documentData.indexOf(doc));
                            },
                          ))
                      .toList()
                  // DocumentButton(
                  //   documentText: 'B-BBEE Verification Level 1',
                  //   isSelected: selectedIndex == 0,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(0);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'B-BBEE Certificate',
                  //   isSelected: selectedIndex == 1,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(1);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Company Profile',
                  //   isSelected: selectedIndex == 2,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(2);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Audi Approval Confirmation',
                  //   isSelected: selectedIndex == 3,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(3);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Chev Approval',
                  //   isSelected: selectedIndex == 4,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(4);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Datsun Approval - Indefinite Certificate',
                  //   isSelected: selectedIndex == 5,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(5);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Hyundai Approval',
                  //   isSelected: selectedIndex == 6,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(6);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'VW Approval Confirmation',
                  //   isSelected: selectedIndex == 7,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(7);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText:
                  //       'FCA / MOPAR - Alfa Romeo / Chrysler / Dodge / Fiat / Jeep / Abarth Approval / Fiat Professional',
                  //   isSelected: selectedIndex == 8,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(8);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Chevrolet Approval',
                  //   isSelected: selectedIndex == 9,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(9);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'Ford Approval',
                  //   isSelected: selectedIndex == 10,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(10);
                  //   },
                  // ),
                  // DocumentButton(
                  //   documentText: 'BMW Approval',
                  //   isSelected: selectedIndex == 11,
                  //   onPressedDownload: () {},
                  //   onPressPreview: () {},
                  //   onTap: () {
                  //     _handleDocumentSelection(11);
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
