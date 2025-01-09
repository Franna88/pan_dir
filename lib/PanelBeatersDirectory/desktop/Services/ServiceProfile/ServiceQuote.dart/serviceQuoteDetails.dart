import 'package:flutter/material.dart';

class ServiceQuoteDetails {
  late TextEditingController name;
  late TextEditingController surname;
  late TextEditingController email;
  late TextEditingController contact;
  late TextEditingController make;
  late TextEditingController model;
  late TextEditingController year;
  late TextEditingController insuranceCompany;
  late TextEditingController vin;
  late TextEditingController message;

  ServiceQuoteDetails() {
    name = TextEditingController();
    surname = TextEditingController();
    email = TextEditingController();
    contact = TextEditingController();
    make = TextEditingController();
    model = TextEditingController();
    year = TextEditingController();
    insuranceCompany = TextEditingController();
    vin = TextEditingController();
    message = TextEditingController();
  }

  void dispose() {
    name.dispose();
    surname.dispose();
    email.dispose();
    contact.dispose();
    make.dispose();
    model.dispose();
    year.dispose();

    insuranceCompany.dispose();
    vin.dispose();
    message.dispose();
  }

/*
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
*/

  getValues() {
    return {
      "name": name.text,
      "surname": surname.text,
      "email": email.text,
      "contact": contact.text,
      "make": make.text,
      "model": model.text,
      "year": year.text,
      "insuranceCompany": insuranceCompany.text,
      "vin": insuranceCompany.text,
      "message": insuranceCompany.text,
      "date": DateTime.now()
    };
  }
}
