import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/AccreditationServiceMobile/AccreditationFilterMobile/AccreditationfilterMobile.dart';
import 'package:webdirectories/PanelBeatersDirectory/utils/firebaseImageUtils.dart';

import '../../../desktop/Services/AccreditationService/AccreditationImageContainer/AccreditationImageContainer.dart';

class AccreditationServiceMobile extends StatefulWidget {
  final int listingId;
  const AccreditationServiceMobile({super.key, required this.listingId});

  @override
  State<AccreditationServiceMobile> createState() =>
      _AccreditationServiceMobileState();
}

class _AccreditationServiceMobileState
    extends State<AccreditationServiceMobile> {
  final _firestore = FirebaseFirestore.instance;
  Map<String, List<Map<String, dynamic>>> _accreditationData = {};
  String? _selectedAccreditationType;

  List<Map<String, dynamic>> get _filteredAccreditations {
    if (_selectedAccreditationType == null) {
      // If no accreditation type is selected, return an empty list or you can return all items
      return [];
    }
    return _accreditationData[_selectedAccreditationType!] ?? [];
  }

  void _onAccreditationTypeSelected(String type) {
    setState(() {
      _selectedAccreditationType = type;
    });
  }

  bool _isLoading = true;
  @override
  void initState() {
    _fetchAndOrganizeServices();
    super.initState();
  }

  void _fetchAndOrganizeServices() async {
    try {
      // Initialize the map to organize services
      Map<String, List<Map<String, dynamic>>> servicesMap = {};

      // Fetch approvals linked to the listing
      QuerySnapshot<Map<String, dynamic>> listingApprovalsSnapshot =
          await _firestore
              .collection('listing_approvals')
              .where('listingsId', isEqualTo: widget.listingId)
              .get();

      print("APPROVALS: ${listingApprovalsSnapshot.docs.length}");
      if (listingApprovalsSnapshot.docs.isNotEmpty) {
        // Collect all approvals IDs
        List<int> approvalIds = listingApprovalsSnapshot.docs
            .map((doc) => doc.data()['approvalsId'] as int)
            .toList();

        // Fetch all approvals in a single query
        QuerySnapshot<Map<String, dynamic>> approvalsSnapshot = await _firestore
            .collection('approvals')
            .where('approvalsId', whereIn: approvalIds)
            .get();

        await _processApprovals(approvalsSnapshot, servicesMap);

        // Update state once processing is done
        setState(() {
          _selectedAccreditationType = servicesMap.keys.first;
          _accreditationData = servicesMap;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error fetching services: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _processApprovals(
      QuerySnapshot<Map<String, dynamic>> approvalsSnapshot,
      Map<String, List<Map<String, dynamic>>> servicesMap) async {
    try {
      // Parallelize approval processing
      await Future.wait(approvalsSnapshot.docs.map((approvalDoc) async {
        Map<String, dynamic> approvalData = approvalDoc.data();
        String? imageUrl =
            await getImageUrl('images/logos/${approvalData['approvalsFile']}');

        if (imageUrl != null) {
          int approvalsCategoryId = approvalData['approvalsCategoryId'];
          print('approvalsCategoryID: $approvalsCategoryId');

          // Cache category data if it repeats
          String categoryName =
              await _getApprovalCategoryName(approvalsCategoryId);

          // Add data to services map
          servicesMap.putIfAbsent(categoryName, () => []).add({
            'imageUrl': imageUrl,
            'link': approvalData['approvalsUrl'],
          });
        }
      }));
    } catch (e) {
      print('Error processing approvals: $e');
    }
  }

// Helper function to fetch approval category name
  Future<String> _getApprovalCategoryName(int categoryId) async {
    QuerySnapshot<Map<String, dynamic>> categorySnapshot = await _firestore
        .collection('approvals_category')
        .where('approvalsCategoryId', isEqualTo: categoryId)
        .get();

    return categorySnapshot.docs.first.data()['approvalsCategory'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
            child: AccreditationfilterMobile(
                selectedFilter: _selectedAccreditationType,
                onFilterSelected: _onAccreditationTypeSelected,
                filterOptions: _accreditationData.keys.toList())),
        AccreditationImageContainer(
          data: _filteredAccreditations,
        )
      ],
    );
  }
}
