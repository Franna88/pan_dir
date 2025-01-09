import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/ManageMyAccount/ManageComponents/AccountDatePicker.dart';
import 'package:webdirectories/myutility.dart';

import '../../AdminProfile/ProfileComp/TextField/ProfileTextField.dart';
import '../../AdminProfile/ProfileComp/buttons/AddButton.dart';
import '../../PopUps/PopUpsCommon/PopUpsDropdown.dart';
import '../ManageComponents/AccountLongTextField.dart';
import 'invoiceList.dart';
import 'package:http/http.dart' as http;

class ViewRecords extends StatefulWidget {
  const ViewRecords({super.key});

  @override
  State<ViewRecords> createState() => _ViewRecordsState();
}

class _ViewRecordsState extends State<ViewRecords> {
  getClientListFromBilDozer() {
    return http.get(
      Uri.parse('https://secure.billdozer.com/api/rest/client/list'),
      headers: {
        'apiKey': 'cacd3efb-518e-4711-bb7d-2da461a9dfaf',
        'password': 'bills',
        'page': '1',
        'perPage': '100',
        'type': 'INVOICE',
        'rfromDateTime': '2015-06-01T00:00:00UTC',
        'emailAddress': 'tny@applord.co.za'
      },
    );
  }

  displayData() async {
    final response = await getClientListFromBilDozer();

    final decode =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    print(decode);
  }

  getRegKeyForBillDozer() {
    return http.get(
      Uri.parse(
          'https://secure.billdozer.com/api/rest/portaluser/registrationkey/tny@applord.co.za'),
      headers: {
        'apiKey': 'cacd3efb-518e-4711-bb7d-2da461a9dfaf',
        'password': 'bills',
        'page': '1',
        'perPage': '10',
        'type': 'INVOICE',
        'rfromDateTime': '2015-06-01T00:00:00UTC',
        'accountNumber': 'GT260'
      },
    );
  }

  displayInvoices() async {
    final response = await getRegKeyForBillDozer();

    final decode =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    print(decode);
    if (decode['status'] == "OK") {
      var url = Uri.parse(
          "https://secure.billdozer.com/portal/pages/secure/view?registrationKey=${decode['id']}");
      launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MyUtility(context).height * 0.42,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'View Records',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.6064,
              fontFamily: 'ralewaybold',
            ),
          ),
          Text(
            'View and download your payment history and invoices',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.73,
              fontFamily: 'raleway',
            ),
          ),
          AccountLongTextField(
            descriptionText: 'Panel Beater Directory Membership Number',
            length: 0.37,
            controller: null,
          ),
          AccountDatePicker(
            descriptionText: 'Invoices',
            length: 0.8,
            hintText: 'Please select date to view or download your invoices',
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: AccountDatePicker(
              descriptionText: 'Statements',
              length: 0.8,
              hintText:
                  'Please select date to view or download your statements',
            ),
          ),
          Row(
            children: [
              AddButton(
                  text: "View Invoices",
                  onPressed: () {
                    displayData();
                  }),
            ],
          ),
          SizedBox(
            height: 15,
          )

          //InvoiceList(),
        ],
      ),
    );
  }
}
