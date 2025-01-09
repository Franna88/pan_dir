import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/Services/DocumentsServices/ViewDocuments/ViewDocuments.dart';
import 'package:webdirectories/myutility.dart';

class DocumentsServices extends StatefulWidget {
  final int listingsId;
  const DocumentsServices({super.key, required this.listingsId});

  @override
  State<DocumentsServices> createState() => _DocumentsServicesState();
}

class _DocumentsServicesState extends State<DocumentsServices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ViewDocuments(id: widget.listingsId)],
        ),
        SizedBox(
          height: MyUtility(context).height * 0.025,
        )
      ],
    );
  }
}
