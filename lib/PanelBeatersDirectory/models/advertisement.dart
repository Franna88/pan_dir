class AdvertisementModel {
  String id; // Add this field for the document ID
  String dateAdded;
  String dateUpdated;
  String immageDescription;
  String immageFile;
  String immageTitle;
  int listingsId;
  int membersId;
  int specialsOrder;
  bool? displayOnBusinessProfile;

  AdvertisementModel({
    required this.id, // Include id in constructor
    required this.dateAdded,
    required this.dateUpdated,
    required this.immageDescription,
    required this.immageFile,
    required this.immageTitle,
    required this.listingsId,
    required this.membersId,
    required this.specialsOrder,
    this.displayOnBusinessProfile,
  });

  // Modify the fromMap method to accept the document ID
  factory AdvertisementModel.fromMap(Map<String, dynamic> data, String id) {
    return AdvertisementModel(
      id: id,
      dateAdded: data['dateAdded'] ?? '',
      dateUpdated: data['dateUpdated'] ?? '',
      immageDescription: data['immageDescription'] ?? '',
      immageFile: data['immageFile'] ?? '',
      immageTitle: data['immageTitle'] ?? '',
      listingsId: data['listingsId'] ?? 0,
      membersId: data['membersId'] ?? 0,
      specialsOrder: data['specialsOrder'] ?? 0,
      displayOnBusinessProfile: data['displayOnBusinessProfile'] ?? false,
    );
  }

  // toMap method to convert to Firestore format
  Map<String, dynamic> toMap() {
    return {
      'dateAdded': dateAdded,
      'dateUpdated': dateUpdated,
      'immageDescription': immageDescription,
      'immageFile': immageFile,
      'immageTitle': immageTitle,
      'listingsId': listingsId,
      'membersId': membersId,
      'specialsOrder': specialsOrder,
      'displayOnBusinessProfile': displayOnBusinessProfile,
    };
  }
}
