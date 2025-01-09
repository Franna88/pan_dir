import 'package:flutter/material.dart';

import '../../AdminProfile/ProfileComp/TextField/ProfileTextField.dart';

class InvoiceList extends StatefulWidget {
  const InvoiceList({super.key});

  @override
  State<InvoiceList> createState() => _InvoiceListState();
}

class _InvoiceListState extends State<InvoiceList> {
  final searchResults = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileTextField(controller: searchResults, headline: 'Invoices:'),
      ],
    );
  }
}
