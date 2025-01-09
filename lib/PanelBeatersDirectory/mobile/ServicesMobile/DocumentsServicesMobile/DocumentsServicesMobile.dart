import 'package:flutter/material.dart';

import 'package:webdirectories/PanelBeatersDirectory/mobile/ServicesMobile/DocumentsServicesMobile/ViewDocumentsMobile/ViewDocumentsMobile.dart';

class DocumentsServicesMobile extends StatefulWidget {
  final int listingsId;
  const DocumentsServicesMobile({super.key, required this.listingsId});

  @override
  State<DocumentsServicesMobile> createState() =>
      _DocumentsServicesMobileState();
}

class _DocumentsServicesMobileState extends State<DocumentsServicesMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ViewDocumentsMobile(id: widget.listingsId),
        ),
      ],
    );
  }
}
