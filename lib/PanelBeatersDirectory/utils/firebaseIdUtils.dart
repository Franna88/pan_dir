import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getHighestListingsId() async {
  try {
    // Reference to the listings collection
    CollectionReference listings =
        FirebaseFirestore.instance.collection('listings');

    // Query to get the document with the highest listingsId
    QuerySnapshot querySnapshot = await listings
        .orderBy('listingsId',
            descending: true) // Sort by listingsId in descending order
        .limit(1) // Limit to the first document
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Extract the highest listingsId
      int highestListingsId = querySnapshot.docs.first['listingsId'];
      return highestListingsId;
    } else {
      // If no documents exist
      print('No documents in listings collection.');
      return 0; // Return a default value
    }
  } catch (e) {
    print('Error fetching highest listingsId: $e');
    return 0; // Return a default value in case of error
  }
}

Future<int> getHighestListingMembersId() async {
  try {
    // Reference to the listings_members collection
    CollectionReference listingsMembers =
        FirebaseFirestore.instance.collection('listing_members');

    // Query to get the document with the highest listingMembersId
    QuerySnapshot querySnapshot = await listingsMembers
        .orderBy('listingMembersId',
            descending: true) // Sort by listingMembersId in descending order
        .limit(1) // Limit to the first document
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Extract the highest listingMembersId
      int highestListingMembersId =
          querySnapshot.docs.first['listingMembersId'];
      return highestListingMembersId;
    } else {
      // If no documents exist
      print('No documents in listings_members collection.');
      return 0; // Return a default value
    }
  } catch (e) {
    print('Error fetching highest listingMembersId: $e');
    return 0; // Return a default value in case of error
  }
}

Future<int> getHighestAllocationId() async {
  try {
    // Reference to the listing_allocation collection
    CollectionReference listingAllocation =
        FirebaseFirestore.instance.collection('listing_allocation');

    // Query to get the document with the highest allocationId
    QuerySnapshot querySnapshot = await listingAllocation
        .orderBy('allocationId',
            descending: true) // Sort by allocationId in descending order
        .limit(1) // Limit to the first document
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Extract the highest allocationId
      int highestAllocationId = querySnapshot.docs.first['allocationId'];
      return highestAllocationId;
    } else {
      // If no documents exist
      print('No documents in listing_allocation collection.');
      return 0; // Return a default value
    }
  } catch (e) {
    print('Error fetching highest allocationId: $e');
    return 0; // Return a default value in case of error
  }
}
