import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ServiceQuote.dart/serviceQuoteForm.dart';
import '../ProfileIconContact.dart';

class ProfileSocials extends StatefulWidget {
  final Map<String, String> socialsLinks;
  final Function(int) updatePageIndex;
  ProfileSocials(
      {super.key, required this.socialsLinks, required this.updatePageIndex});

  @override
  State<ProfileSocials> createState() => _ProfileSocialsState();
}

class _ProfileSocialsState extends State<ProfileSocials> {
  //Dialog for notification popup
  Future openQuoteForm() => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            child: ServiceQuoteForm(
                listingsId: widget.socialsLinks['listingsId'],
                email: widget.socialsLinks['email']));
      });
  @override
  Widget build(BuildContext context) {
    print(widget.socialsLinks);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          ProfileSocialIconContact(
              profileIcon: 'images/maps.svg',
              socialdescription: 'Navigate Me',
              onPress: () async {
                final Uri uri = Uri.parse(
                    "https://www.google.com/maps/search/${widget.socialsLinks['streetaddress']}");
                await launchUrl(uri);
              }),
          SizedBox(
            width: 4,
          )
        ]),
        widget.socialsLinks['telephone'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    isComingSoon: true,
                    profileIcon: 'images/Contact1.svg',
                    socialdescription: 'Call',
                    onPress: () {}),
                SizedBox(
                  width: 4,
                )
              ])
            : SizedBox(),
        widget.socialsLinks['email'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    profileIcon: 'images/Contact7.svg',
                    socialdescription: 'Email',
                    onPress: () async {
                      final Uri uri =
                          Uri.parse("mailto:${widget.socialsLinks['email']}");
                      await launchUrl(uri);
                    }),
                SizedBox(
                  width: 4,
                )
              ])
            : SizedBox(),
        widget.socialsLinks['whatsapp'] != null
            ? Row(children: [
                ProfileSocialIconContact(
                    isComingSoon: true,
                    profileIcon: 'images/Contact6.svg',
                    socialdescription: 'WhatsApp',
                    onPress: () async {}),
                SizedBox(
                  width: 4,
                ),
              ])
            : SizedBox(),
        ProfileSocialIconContact(
            profileIcon: 'images/GetQuote.svg',
            socialdescription: 'Get Quote',
            onPress: () {
              openQuoteForm();
            }),
        ProfileSocialIconContact(
            profileIcon: 'images/Contact5.svg',
            socialdescription: 'Leave Review',
            onPress: () {
              widget.updatePageIndex(6);
            }),
      ],
    );
  }
}
