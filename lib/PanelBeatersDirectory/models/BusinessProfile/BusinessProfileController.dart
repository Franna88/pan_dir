import 'package:flutter/material.dart';

class Businessprofilecontroller {
  late TextEditingController tradingNameController;
  late TextEditingController registeredNameController;
  late TextEditingController bEEElevelController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController provinceController;
  late TextEditingController suburbController;
  late TextEditingController streetController;
  late TextEditingController customerCareController;
  late TextEditingController whatsappController;
  late TextEditingController businessAlternativeController;
  late TextEditingController businessFaxController;
  late TextEditingController afterHoursController;
  late TextEditingController moreInfoController;

  Businessprofilecontroller() {
    tradingNameController = TextEditingController();
    registeredNameController = TextEditingController();
    bEEElevelController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    provinceController = TextEditingController();
    suburbController = TextEditingController();
    streetController = TextEditingController();
    customerCareController = TextEditingController();
    whatsappController = TextEditingController();
    businessAlternativeController = TextEditingController();
    businessFaxController = TextEditingController();
    afterHoursController = TextEditingController();
    moreInfoController = TextEditingController();
  }

  void dispose() {
    tradingNameController.dispose();
    registeredNameController.dispose();
    bEEElevelController.dispose();
    countryController.dispose();
    cityController.dispose();
    provinceController.dispose();
    suburbController.dispose();
    streetController.dispose();
    customerCareController.dispose();
    whatsappController.dispose();
    businessAlternativeController.dispose();
    businessFaxController.dispose();
    afterHoursController.dispose();
    moreInfoController.dispose();
  }

  void setValues(Map<String, dynamic> userData) {
    tradingNameController.text = userData['title'] ?? '';
    registeredNameController.text = userData['registeredBussinessName'] ?? '';
    bEEElevelController.text = userData['beerating'] ?? '';
    countryController.text = userData['country'] ?? '';
    cityController.text = userData['city'] ?? '';
    provinceController.text = userData['province'] ?? '';
    suburbController.text = userData['suburb'] ?? '';
    streetController.text = userData['streetaddress'] ?? '';
    customerCareController.text = userData['businessTelephone'] ?? '';
    whatsappController.text = userData['whatsappNumber'] ?? '';
    businessAlternativeController.text = userData['alternativeNumber'] ?? '';
    businessFaxController.text = userData['businessFaxnumber'] ?? '';
    afterHoursController.text = userData['businessAfterhours'] ?? '';
    moreInfoController.text = userData['moreInfo'] ?? '';
  }

  getValues() {
    return {
      "title": tradingNameController.text,
      "registeredBussinessName": registeredNameController.text,
      "beerating": bEEElevelController.text,
      "businessTelephone": customerCareController.text,
      "whatsappNumber": whatsappController.text,
      "alternativeNumber": businessAlternativeController.text,
      "businessFaxnumber": businessFaxController.text,
      "businessAfterhours": afterHoursController.text
    };
  }
}
