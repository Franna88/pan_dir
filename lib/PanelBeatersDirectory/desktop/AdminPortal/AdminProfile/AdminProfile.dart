import 'package:flutter/material.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminContact/AdminContactComp/AdminContactAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminHoursAlt.dart/AdminHoursAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/Documents/Documentscomp/DocumentAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/AdminApprovals/Approvals.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/Pages/RegistrationNumbers/RegistrationNumbersComp/RegistrationAlt.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/AdminPortal/AdminProfile/ProfileComp/buttons/ProfileButton.dart';

import '../../../models/storedUser.dart';
import '../../../utils/loginUtils.dart';
import 'AdminMediaLinks.dart/AdminMediaLink.dart';
import 'MoreInfoAlt/MoreInfoAlt.dart';
import 'Pages/AdminBusinessSetup/adminBusinessSetup.dart';
import 'Pages/Gallery/GalleryComp/GalaryAlt.dart';

class AdminProfile extends StatefulWidget {
  Function getListingId;
  AdminProfile({Key? key, required this.getListingId}) : super(key: key);

  @override
  State<AdminProfile> createState() => _AdminProfileState();
}

class _AdminProfileState extends State<AdminProfile> {
  final TextEditingController _textController = TextEditingController();
  String selectedButton = 'Business Info';
  var pageIndex = 0;

  updateIndex(index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var pages = [
      AdminusinessSetup(getListingId: widget.getListingId),
      //RegistrationNumbers(),
      RegistrationAlit(getListingId: widget.getListingId),
      //Documents(),
      DocumentAlt(getListingId: widget.getListingId),
      //AdminContact(),
      AdminContactAlt(getListingId: widget.getListingId),
      Approvals(getListingId: widget.getListingId),
      MoreInfoALt(getListingId: widget.getListingId),
      GalleryAlt(getListingId: widget.getListingId),
      AdminHoursAlt(getListingId: widget.getListingId),
      AdminMediaLink(getListingId: widget.getListingId)
    ];
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: false,
          backgroundColor: Color(0xFF171616),

          elevation: 0, // Optional: If you don't want elevation
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 50, // Changed height from 50 to 70
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 46, 46, 46),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileButton(
                      text: 'Business Info',
                      isSelected: selectedButton == 'Business Info',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Business Info';
                          updateIndex(0);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Registration',
                      isSelected: selectedButton == 'Registration',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Registration';
                          updateIndex(1);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Documents',
                      isSelected: selectedButton == 'Documents',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Documents';
                          updateIndex(2);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Contact',
                      isSelected: selectedButton == 'Contact',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Contact';
                          updateIndex(3);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Approvals',
                      isSelected: selectedButton == 'Approvals',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Approvals';
                          updateIndex(4);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'More Info',
                      isSelected: selectedButton == 'More Info',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'More Info';
                          updateIndex(5);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Gallery',
                      isSelected: selectedButton == 'Gallery',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Gallery';
                          updateIndex(6);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Hours',
                      isSelected: selectedButton == 'Hours',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Hours';
                          updateIndex(7);
                        });
                      },
                    ),
                    ProfileButton(
                      text: 'Media Links',
                      isSelected: selectedButton == 'Media Links',
                      onPressed: () {
                        setState(() {
                          selectedButton = 'Media Links';
                          updateIndex(8);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Center(
                    child: pages[pageIndex],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
