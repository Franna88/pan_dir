import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/Approvals&Services/custom_menu_scroll_dropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/Approvals&Services/mainBlackButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/dropDownMenus/dropDownMenuWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDropdown.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/searchButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/setYourLocationButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/textfieldButton.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/components/addressAutoCompleteField.dart';
import 'package:webdirectories/main.dart';
import 'package:webdirectories/routes/routerNames.dart';

enum ApprovalsServicesCategory {
  specialServices,
  insurancePanel,
  vehicleBrand,
  commercialVehicleBrand,
  commercialVehicleService
}

enum SearchType {
  nearme,
  address,
}

class ApprovalsServices extends StatefulWidget {
  const ApprovalsServices({super.key});

  @override
  State<ApprovalsServices> createState() => _ApprovalsServicesState();
}

class _ApprovalsServicesState extends State<ApprovalsServices> {
  final firestore = FirebaseFirestore.instance;
  final TextEditingController addressFieldController = TextEditingController();
  int menuIndex = 3;
  int? currentOpenDropdown;
  bool isOrangeColumnVisible = true;
  bool isBlackDropdownSelected = false;

  // dropdown lists
  List<Map<String, dynamic>> specialServicesDropdownItems = [];
  List<Map<String, dynamic>> insurancePanelDropdownItems = [];
  List<Map<String, dynamic>> vehicleBrandDropdownItems = [];
  List<Map<String, dynamic>> commercialVehicleBrandDropdownItems = [];
  List<Map<String, dynamic>> commercialVehicleServiceDropdownItems = [];

  // selected dropdown items
  String selectedSpecialServicesDropdownItems = "";
  String selectedInsurancePanelDropdownItems = "";
  String selectedVehicleBrandDropdownItems = "";
  String selectedCommercialVehicleBrandDropdownItems = "";
  String selectedCommercialVehicleServiceDropdownItems = "";

  Map<String, dynamic> address = {};

  SearchType searchType = SearchType.nearme;

  @override
  void initState() {
    super.initState();
    fetchDropdownItems();
  }

  void toggleDropdown(int index) {
    setState(() {
      if (currentOpenDropdown == index) {
        currentOpenDropdown = null;
      } else {
        currentOpenDropdown = index;
      }
    });
  }

  void onDropdownSelection(String value, ApprovalsServicesCategory category) {
    setState(() {
      isBlackDropdownSelected = true;
    });

    switch (category) {
      case ApprovalsServicesCategory.specialServices:
        selectedSpecialServicesDropdownItems = value;
        break;
      case ApprovalsServicesCategory.insurancePanel:
        selectedInsurancePanelDropdownItems = value;
        break;
      case ApprovalsServicesCategory.vehicleBrand:
        selectedVehicleBrandDropdownItems = value;
        break;
      case ApprovalsServicesCategory.commercialVehicleBrand:
        selectedCommercialVehicleBrandDropdownItems = value;
        break;
      case ApprovalsServicesCategory.commercialVehicleService:
        selectedCommercialVehicleServiceDropdownItems = value;
        break;
    }
  }

  void setSearchType(SearchType searchType) {
    setState(() {
      this.searchType = searchType;
    });
  }

  void onSearchButtonPressed() {
    setState(() {
      isOrangeColumnVisible = false; // Hide the orange column
    });
  }

  Future<void> fetchDropdownItems() async {
    // Fetch dropdown items from Firestore
    await Future.wait([
      fetchSpecialServicesDropdownItems(),
      fetchInsurancePanelDropdownItems(),
      fetchVehicleBrandDropdownItems(),
      fetchCommercialVehicleBrandDropdownItems(),
      fetchCommercialVehicleServiceDropdownItems(),
    ]);
  }

  Future<void> fetchSpecialServicesDropdownItems() async {
    // Fetch dropdown items from Firestore
    QuerySnapshot specialServicesSnapshot = await firestore
        .collection('approvals')
        .where('approvalsCategoryId', isEqualTo: 5)
        .get();
    specialServicesDropdownItems = specialServicesSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        "name": data['approvalsTitle'],
        "value": data['approvalsId'].toString(),
      };
    }).toList();
    specialServicesDropdownItems.sort((a, b) => a['name'].compareTo(b['name']));
  }

  Future<void> fetchInsurancePanelDropdownItems() async {
    // Fetch dropdown items from Firestore
    QuerySnapshot insurancePanelSnapshot = await firestore
        .collection('approvals')
        .where('approvalsCategoryId', isEqualTo: 4)
        .get();
    insurancePanelDropdownItems = insurancePanelSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        "name": data['approvalsTitle'],
        "value": data['approvalsId'].toString(),
      };
    }).toList();
    insurancePanelDropdownItems.sort((a, b) => a['name'].compareTo(b['name']));
  }

  Future<void> fetchVehicleBrandDropdownItems() async {
    // Fetch dropdown items from Firestore
    QuerySnapshot vehicleBrandSnapshot = await firestore
        .collection('approvals')
        .where('approvalsCategoryId', isEqualTo: 1)
        .get();
    vehicleBrandDropdownItems = vehicleBrandSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        "name": data['approvalsTitle'],
        "value": data['approvalsId'].toString(),
      };
    }).toList();
    vehicleBrandDropdownItems.sort((a, b) => a['name'].compareTo(b['name']));
  }

  Future<void> fetchCommercialVehicleBrandDropdownItems() async {
    // Fetch dropdown items from Firestore
    QuerySnapshot commercialVehicleBrandSnapshot = await firestore
        .collection('approvals')
        .where('approvalsCategoryId', isEqualTo: 2)
        .get();
    commercialVehicleBrandDropdownItems =
        commercialVehicleBrandSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        "name": data['approvalsTitle'],
        "value": data['approvalsId'].toString(),
      };
    }).toList();
    commercialVehicleBrandDropdownItems
        .sort((a, b) => a['name'].compareTo(b['name']));
  }

  Future<void> fetchCommercialVehicleServiceDropdownItems() async {
    // Fetch dropdown items from Firestore
    QuerySnapshot commercialVehicleServiceSnapshot = await firestore
        .collection('approvals')
        .where('approvalsCategoryId', isEqualTo: 10)
        .get();
    commercialVehicleServiceDropdownItems =
        commercialVehicleServiceSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return {
        "name": data['approvalsTitle'],
        "value": data['approvalsId'].toString(),
      };
    }).toList();
    commercialVehicleServiceDropdownItems
        .sort((a, b) => a['name'].compareTo(b['name']));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Approvals & Services',
          style: TextStyle(
              fontSize: 34,
              fontFamily: 'ralewaybold',
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        const SizedBox(
          height: 15,
        ),
        Visibility(
          visible: isOrangeColumnVisible, // Show orange column conditionally
          child: Column(
            children: [
              MainButton(
                buttonTitle: 'Near Me',
                dropdownContent: DropDownMenuWidget(
                  topText: 'Find your nearest Panel Beater',
                  widget1: const SetYourLoactionButton(),
                  widget2: SearchButton(
                    onTap: () {
                      setSearchType(SearchType.nearme);
                      onSearchButtonPressed();
                    },
                    isComingSoon: false,
                  ),
                ),
                isOpen: currentOpenDropdown == 0,
                onToggle: () => toggleDropdown(0),
              ),
              const SizedBox(
                height: 15,
              ),
              MainButton(
                buttonTitle: 'Any City or Street Address',
                dropdownContent: DropDownMenuWidget(
                  topText: 'Find a Panel Beater by street',
                  widget1: AddressAutoCompleteField(onSelected: (data) {
                    setState(() {
                      address = data;
                    });
                  }),
                  widget2: SearchButton(
                    onTap: () {
                      setSearchType(SearchType.address);
                      onSearchButtonPressed();
                    },
                    isComingSoon: true,
                  ),
                ),
                isOpen: currentOpenDropdown == 1,
                onToggle: () => toggleDropdown(1),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
        Visibility(
          visible: !isOrangeColumnVisible, // Show black column conditionally
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 30.0, bottom: 10),
                child: Text(
                  'Please select one option from the drop down list below',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'raleway',
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Special Services',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  dropdownItems: specialServicesDropdownItems,
                  onSelection: (String value) {
                    onDropdownSelection(
                        value, ApprovalsServicesCategory.specialServices);
                  },
                ),
                isOpen: currentOpenDropdown == 1,
                onToggle: () => toggleDropdown(1),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Insurance Panel',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  dropdownItems: insurancePanelDropdownItems,
                  onSelection: (String value) {
                    onDropdownSelection(
                        value, ApprovalsServicesCategory.insurancePanel);
                  },
                ),
                isOpen: currentOpenDropdown == 2,
                onToggle: () => toggleDropdown(2),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Vehicle Brand',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  dropdownItems: vehicleBrandDropdownItems,
                  onSelection: (String value) {
                    onDropdownSelection(
                        value, ApprovalsServicesCategory.vehicleBrand);
                  },
                ),
                isOpen: currentOpenDropdown == 3,
                onToggle: () => toggleDropdown(3),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Commercial Vehicle Brand',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  dropdownItems: commercialVehicleBrandDropdownItems,
                  onSelection: (String value) {
                    onDropdownSelection(value,
                        ApprovalsServicesCategory.commercialVehicleBrand);
                  },
                ),
                isOpen: currentOpenDropdown == 4,
                onToggle: () => toggleDropdown(4),
              ),
              const SizedBox(
                height: 15,
              ),
              MainBlackButtonDropdown(
                buttonTitle: 'Commercial Vehicle Services',
                customScrollDropdownContent: CustomMenuScrollDropdown(
                  dropdownItems: commercialVehicleServiceDropdownItems,
                  onSelection: (String value) {
                    onDropdownSelection(value,
                        ApprovalsServicesCategory.commercialVehicleService);
                  },
                ),
                isOpen: currentOpenDropdown == 5,
                onToggle: () => toggleDropdown(5),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Visibility(
                  visible: isBlackDropdownSelected,
                  child: SearchButton(
                    onTap: () {
                      String pathName = searchType == SearchType.nearme
                          ? Routernames.panelbeatersServicesNearMe
                          : Routernames.panelbeatersServicesByAddress;
                      context.goNamed(
                        pathName,
                        extra: {
                          "address": address['address'],
                          "lat": address['lat'],
                          "lng": address['lng'],
                          "specialServices":
                              selectedSpecialServicesDropdownItems,
                          "insurancePanel": selectedInsurancePanelDropdownItems,
                          "vehicleBrand": selectedVehicleBrandDropdownItems,
                          "commercialVehicleBrand":
                              selectedCommercialVehicleBrandDropdownItems,
                          "commercialVehicleService":
                              selectedCommercialVehicleServiceDropdownItems
                        },
                      );
                    },
                    isComingSoon: false,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
