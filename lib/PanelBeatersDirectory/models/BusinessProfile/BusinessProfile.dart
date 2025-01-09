import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessProfileItem.dart';
import 'package:webdirectories/PanelBeatersDirectory/models/BusinessProfile/BusinessTeamItem.dart';

class BusinessProfile {
  BusinessProfileItem tradingName;
  BusinessProfileItem registeredName;
  BusinessProfileItem bBBEELevel;
  BusinessProfileItem country;
  BusinessProfileItem suburb;
  BusinessProfileItem province;
  BusinessProfileItem streetAddress;
  BusinessProfileItem city;
  BusinessProfileItem? customerCareNumber;
  BusinessProfileItem? whatsappNumber;
  BusinessProfileItem? businessAltNumber;
  BusinessProfileItem? businessFaxNumber;
  BusinessProfileItem? afterHrsNumber;
  List<String>? categories;
  List<String>? specialistServices;
  BusinessProfileItem moreInfo;
  List<BusinessTeamItem>? businessTeam;

  BusinessProfile({
    required this.tradingName,
    required this.registeredName,
    required this.bBBEELevel,
    required this.country,
    required this.suburb,
    required this.province,
    required this.streetAddress,
    required this.city,
    this.customerCareNumber,
    this.whatsappNumber,
    this.businessAltNumber,
    this.businessFaxNumber,
    this.afterHrsNumber,
    this.categories,
    this.specialistServices,
    required this.moreInfo,
    this.businessTeam,
  });

  // Optionally, you can add a method to reset all controllers
  void dispose() {
    // dispose all controllers
    tradingName.dispose();
    registeredName.dispose();
    bBBEELevel.dispose();
    country.dispose();
    suburb.dispose();
    province.dispose();
    streetAddress.dispose();
    city.dispose();
    customerCareNumber?.dispose();
    whatsappNumber?.dispose();
    businessAltNumber?.dispose();
    businessFaxNumber?.dispose();
    afterHrsNumber?.dispose();
  }
}
