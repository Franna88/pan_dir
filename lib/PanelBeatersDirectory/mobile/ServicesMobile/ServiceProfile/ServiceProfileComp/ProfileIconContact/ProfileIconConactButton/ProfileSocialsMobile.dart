import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../serviceQuoteMobile/serviceQuoteMobile.dart';
import '../ProfileSocialIconContactMobile.dart';

class ProfileSocialsMobile extends StatefulWidget {
  final Map<String, String> socialsLinks;
  const ProfileSocialsMobile({super.key, required this.socialsLinks});

  @override
  State<ProfileSocialsMobile> createState() => _ProfileSocialsMobileState();
}

class _ProfileSocialsMobileState extends State<ProfileSocialsMobile> {
  //Dialog for notification popup
  Future openQuoteForm() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: ServiceQuoteFormMobile(
                listingsId: widget.socialsLinks['listingsId'],
                email: widget.socialsLinks['email']));
      });
  @override
  Widget build(BuildContext context) {
    /*
     'telephone': listingData['businessTelephone'],
            'email': listingData['businessEmail'],
            'whatsapp': listingData['whatsappNumber'],
     */
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileSocialIconContactMobile(
            profileIcon: 'images/maps.svg',
            socialdescription: 'Navigate Me',
            onPress: () async {
              final Uri uri = Uri.parse(
                  "https://www.google.com/maps/search/${widget.socialsLinks['streetaddress']}");
              await launchUrl(uri);
            }),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact1.svg',
            socialdescription: 'Call',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact6.svg',
            socialdescription: 'WhatsApp',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact7.svg',
            socialdescription: 'Email',
            onPress: () {}),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/GetQuote.svg',
            socialdescription: 'Get\nQuote',
            onPress: () {
              openQuoteForm();
            }),
        ProfileSocialIconContactMobile(
            profileIcon: 'images/Contact5.svg',
            socialdescription: 'Leave\nReview',
            onPress: () {}),
      ],
    );
  }
}
