import 'package:flutter/material.dart';

import 'ServiceProfileComp/ImageScrollContainerMobile.dart';
import 'ServiceProfileComp/ProfileIconContact/ProfileIconConactButton/ProfileSocialsMobile.dart';
import 'ServiceProfileComp/ProfileTextContainerMobile.dart';

class ServiceProfileMobile extends StatefulWidget {
  final List<String> imagesData;
  final Map<String, String> linkData;
  final Map<String, String> contactData;
  const ServiceProfileMobile(
      {super.key,
      required this.imagesData,
      required this.linkData,
      required this.contactData});

  @override
  State<ServiceProfileMobile> createState() => _ServiceProfileMobileState();
}

class _ServiceProfileMobileState extends State<ServiceProfileMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        ImageScrollContainerMobile(images: widget.imagesData),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: ProfileSocialsMobile(socialsLinks: widget.linkData)),
              ProfileTextContainerMobile(
                contactData: widget.contactData,
              ),
            ],
          ),
        )
      ],
    );
  }
}
