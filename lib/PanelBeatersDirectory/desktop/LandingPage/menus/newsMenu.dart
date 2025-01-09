import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/mainButtonDirect.dart';
import 'package:webdirectories/PanelBeatersDirectory/desktop/LandingPage/menus/menuComponents/menuIndexWidget.dart';
import 'package:webdirectories/routes/routerNames.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsMenu extends StatelessWidget {
  const NewsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    int menuIndex = 4;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        MenuIndexWidget(menuIndex: menuIndex),
        const Text(
          'Info & Finance',
          style: TextStyle(
            fontSize: 34,
            fontFamily: 'ralewaybold',
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(
          width: 430,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                'Discover the latest updates in the Auto Body Repair industry. Stay informed with our informative articles.',
                style: TextStyle(
                  color: Color.fromARGB(255, 206, 205, 205),
                  fontSize: 15.64,
                  fontFamily: 'raleway',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Articles',
          onTap: () {
            context.goNamed(Routernames.panelbeatersArticles);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'CSI Lightstone EchoMBR',
          onTap: () {
            context.goNamed(Routernames.panelbeatersRecentArticlesPage);
          },
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Industry News',
          onTap: () async {
            final url = Uri.parse('https://autoref.co.za/');
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              // Handle error if URL can't be launched
              debugPrint('Could not launch $url');
            }
          },
        ),
        const SizedBox(
          height: 15,
        ),
        MainButtonDirect(
          buttonTitle: 'Repair Finance',
          onTap: () {},
          isComingSoon: true,
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
